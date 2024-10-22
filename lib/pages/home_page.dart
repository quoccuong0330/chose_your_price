import 'package:chose_your_price/models/product_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final List<ProductInfo> products = [
  ProductInfo(name: 'iPad', price: 200),
  ProductInfo(name: 'iPhone', price: 423),
  ProductInfo(name: 'Macbook Air', price: 534),
  ProductInfo(name: 'Macbook Pro', price: 234),
  ProductInfo(name: 'iWatch', price: 238),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndexProduct = 0;
  String _priceValue = '';
  String _resultValue = '';
  bool _isActiveNextBtn = true;
  bool _isActivePrevBtn = false;

  final TextEditingController _priceInputController = TextEditingController();

  _handleChangeNextProduct() {
    if (_currentIndexProduct < products.length - 1) {
      setState(() {
        _currentIndexProduct++;
        _resultValue = '';
        _priceInputController.text = '';
        _isActivePrevBtn = true;
      });
      if (_currentIndexProduct == products.length - 1) {
        setState(() {
          _isActiveNextBtn = false;
          // _resultValue = 'Nothing to next';
        });
      }
    }
  }

  _handleChangePrevProduct() {
    if (_currentIndexProduct > 0) {
      setState(() {
        _currentIndexProduct--;
        _resultValue = '';
        _priceInputController.text = '';
        _isActiveNextBtn = true;
      });
      if (_currentIndexProduct == 0) {
        setState(() {
          _isActivePrevBtn = false;
          // _resultValue = 'Nothing to next';
        });
      }
    }
  }

  _handleCheckPrice() {
    String checkResult = '';
    if (_priceValue.isEmpty) {
      checkResult = 'Nothing to check';
    } else if (double.parse(_priceValue) ==
        products[_currentIndexProduct].price) {
      checkResult = 'Pass';
    } else {
      checkResult = 'Failed';
    }
    setState(() {
      _resultValue = checkResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Chose your price"),
      ),
      body: Center(
        child: Column(children: [
          const SizedBox(height: 20),
          Text(products[_currentIndexProduct].name),
          const SizedBox(height: 5),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.8,
            child: TextField(
              controller: _priceInputController,
              onChanged: (value) => _priceValue = value,
              key: const Key('priceInput'),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
          ),
          const SizedBox(height: 5),
          Text(
            _resultValue,
            key: const Key('result'),
            style: const TextStyle(color: Colors.red),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  key: const Key('prevBtn'),
                  onPressed: _isActivePrevBtn ? _handleChangePrevProduct : null,
                  child: const Text('Prev')),
              const SizedBox(width: 20),
              ElevatedButton(
                  key: const Key('checkBtn'),
                  onPressed: _handleCheckPrice,
                  child: const Text('Check')),
              const SizedBox(width: 20),
              ElevatedButton(
                  key: const Key('nextBtn'),
                  onPressed: _isActiveNextBtn ? _handleChangeNextProduct : null,
                  child: const Text('Next')),
            ],
          )
        ]),
      ),
    );
  }
}
