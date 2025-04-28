import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_business_hub/mobile/screens/explorer/screens/supliers/bloc/supliers_blocs.dart';

class SuplierList extends StatefulWidget {
  const SuplierList({super.key});

  @override
  State<SuplierList> createState() => _SuplierListState();
}

class _SuplierListState extends State<SuplierList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        leadingWidth: 80,
        leading: Padding(
          padding: const EdgeInsets.all(5),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              size: 30,
            ),
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        titleSpacing: 100,
        title: Text(
          'Proveedores',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search_rounded,
              size: 30,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
      body: BlocBuilder<GetSuplierBloc, GetSuplierState>(
        builder: (context, state) {
          if (state is GetSuplierSuccess) {
          final suplier = state.suplier;
          if (suplier.isEmpty) {
            return const Center(
              child: Text(
                'No hay clientes registrados',
                style: TextStyle(fontSize: 20),
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: suplier.length,
                  itemBuilder: (context, int i) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(20),
                        child: Ink(
                          height: MediaQuery.of(context).size.height * 0.085,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onPrimary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                        radius:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                        backgroundColor: Colors.grey[300],
                                        child: Text(
                                          suplier[i].name.substring(0,1),
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700],
                                          ),
                                        )),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.02,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          suplier[i].name,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface,
                                          ),
                                        ),
                                        Text(
                                          '${suplier[i].phoneNumber}',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 20,
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        }else if (state is GetSuplierFailure) {
          return const Center(
            child: Text(
              'Error al cargar los proveedores',
              style: TextStyle(fontSize: 20),
            ),
          );
        }else {
          return const Center(
            child: CircularProgressIndicator(),
            );
          }
        }
      ),
    );
  }
}
