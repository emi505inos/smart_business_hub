import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_business_hub/mobile/screens/screens.dart';

class SaleDetail extends StatefulWidget {
  final String saleId;
  const SaleDetail({super.key, required this.saleId});

  @override
  State<SaleDetail> createState() => _SaleDetailState();
}

class _SaleDetailState extends State<SaleDetail> {
  late Stream<QuerySnapshot>  incomeStream;
    String _getPaymentMethod(int payMethod) {
    switch (payMethod) {
      case 0:
        return 'Efectivo';
      case 1:
        return 'Tarjeta';
      case 2:
        return 'Transferencia';
      case 3:
        return 'Otro';
      default:
        return 'Desconocido';
    }
  }
  @override
  void initState() {
    super.initState();
    incomeStream = FirebaseFirestore.instance
        .collection('income')
        .where('saleId', isEqualTo: widget.saleId)
        .snapshots();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => BalanceScreen()));
              },
              icon: Icon(
                Icons.arrow_back_rounded,
                size: 30,
              ),
              color: Theme.of(context).colorScheme.onSurface,
            ),
          
        ),
        title: Text(
          'Detalles de la venta',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: 
      StreamBuilder(
        stream: incomeStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text(
                'No se encontraron ingresos',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
              ),
            );
          }
          final income = snapshot.data!.docs.first;
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.46,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Resumen de la venta',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                        Text(
                          'Transacción #${income['saleId']}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                        Divider(
                          height: 3,
                          indent: 1,
                          endIndent: 1,
                          thickness: 1.7,
                          color: Colors.grey[400],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                        Text(
                          'Concepto',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                        Text(
                          '${income['category']}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                        Divider(
                          height: 3,
                          indent: 1,
                          endIndent: 1,
                          thickness: 1.7,
                          color: Colors.grey[400],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                        Text(
                          'Valor total',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                        Text(
                          '\$ ${income['income']}',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                        Divider(
                          height: 3,
                          indent: 1,
                          endIndent: 1,
                          thickness: 1.7,
                          color: Colors.grey[400],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Fecha y hora',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                            Text(
                              DateFormat('hh:mm a | dd MMMM yyyy').format(DateTime.parse(income['dateTime'].toDate().toString())),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Método de pago',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                            Text(
                              _getPaymentMethod(income['payMethod']),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    
                      ],
                    ),
                  )
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Theme.of(context).colorScheme.onSecondary,
                            radius: 30,
                            child: IconButton(
                              onPressed: () {
                              },
                              icon: Icon(
                                Icons.local_print_shop_outlined,
                                color: Theme.of(context).colorScheme.onPrimary,
                                size: 30,
                              ),
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                          Text(
                            'Imprimir',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onSecondary,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey[350],
                            radius: 30,
                            child: IconButton(
                              onPressed: () {
                              },
                              icon: Icon(
                                Icons.receipt_long_outlined,
                                color: Colors.grey[600],
                                size: 30,
                              ),
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                          Text(
                            'Comprobante',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600],
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Theme.of(context).colorScheme.onSurface,
                            radius: 30,
                            child: IconButton(
                              onPressed: () {
                              },
                              icon: Icon(
                                Icons.create_outlined,
                                color: Theme.of(context).colorScheme.onPrimary,
                                size: 30,
                              ),
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                          Text(
                            'Editar',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Theme.of(context).colorScheme.secondary,
                            radius: 30,
                            child: IconButton(
                              onPressed: () {
                              },
                              icon: Icon(
                                Icons.delete_outline,
                                color: Theme.of(context).colorScheme.onPrimary,
                                size: 30,
                              ),
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                          Text(
                            'Eliminar',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }
      ),
      
    );
  }
}