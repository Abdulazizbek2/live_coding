import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_investment_app/core/widgets/custom_text_field.dart';

import '../../data/data_source/stocks_remote_data_source.dart';
import '../../data/repository/stocks_repository_impl.dart';
import '../bloc/stocks_bloc.dart';
import '../bloc/stocks_event.dart';
import '../bloc/stocks_state.dart';
import '../widgets/stock_list_item.dart';

class StocksListPage extends StatelessWidget {
  const StocksListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StocksBloc(
        repository: StocksRepositoryImpl(
          remoteDataSource: StocksRemoteDataSourceImpl(
            client: InsecureHttpClient(),
          ),
        ),
      )..add(LoadStocks()),
      child: const StocksListView(),
    );
  }
}

class StocksListView extends StatelessWidget {
  const StocksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     'Stocks',
      //     style: TextStyle(
      //       fontFamily: 'SFProText',
      //       fontWeight: FontWeight.w600,
      //     ),
      //   ),
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      //   foregroundColor: Colors.black,
      // ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        title: const Text(
          'Stock Investment',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        toolbarHeight: 150 + 28,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 54,
                child: Center(
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: CustomTextField(
                        hint: 'Search Stocks',
                        contentPadding: EdgeInsets.zero,
                        prefixIcon: Icon(
                          Icons.search,
                          size: 24,
                        ),
                      )),
                ),
              ),
              SizedBox(
                height: 52,
                child: ListView(
                  padding: const EdgeInsets.only(left: 8.0),
                  scrollDirection: Axis.horizontal,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Chip(label: Text('All')),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Chip(label: Text('Technology')),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Chip(label: Text('Finance')),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Chip(label: Text('Healthcare')),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: SizedBox(
                  height: 28,
                  child: Text(
                    '342 stocks found',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // body: ListView.builder(
      //     itemCount: 20,
      //     itemBuilder: (context, index) {
      //       return ListTile(
      //         title: Text('Stock Item ${index + 1}'),
      //       );
      //     }),

      body: BlocBuilder<StocksBloc, StocksState>(
        builder: (context, state) {
          if (state is StocksLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is StocksError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 64,
                    color: Colors.red[300],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Error loading stocks',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SFProText',
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      state.message,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'SFProText',
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      context.read<StocksBloc>().add(LoadStocks());
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 12,
                      ),
                    ),
                    child: const Text(
                      'Retry',
                      style: TextStyle(
                        fontFamily: 'SFProText',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          if (state is StocksLoaded) {
            if (state.stocks.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.inbox_outlined,
                      size: 64,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'No stocks available',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'SFProText',
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: () async {
                context.read<StocksBloc>().add(RefreshStocks());
                await Future.delayed(const Duration(milliseconds: 500));
              },
              child: ListView.separated(
                itemCount: state.stocks.length,
                separatorBuilder: (context, index) => Divider(
                  height: 1,
                  indent: 76,
                  color: Colors.grey[200],
                ),
                itemBuilder: (context, index) {
                  final stock = state.stocks[index];
                  return StockListItem(
                    stock: stock,
                    onTap: () {
                      // TODO: Navigate to stock details
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${stock.companyName} tapped'),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                  );
                },
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
