import './estimation_value.dart';

class EstimationValues {
  static List<EstimationValue> standardList = [
    EstimationValue(value: 1.toString(), description: 'test description'),
    EstimationValue(value: 2.toString(), description: 'test description'),
    EstimationValue(value: 3.toString(), description: 'test description'),
    EstimationValue(value: 5.toString(), description: 'test description'),
    EstimationValue(value: 8.toString(), description: 'test description'),
    EstimationValue(value: 13.toString(), description: 'test description'),
    EstimationValue(value: 20.toString(), description: 'test description'),
    EstimationValue(value: 40.toString(), description: 'test description'),
    EstimationValue(value: 100.toString(), description: 'test description'),
    EstimationValue(value: '∞', description: 'test description'),
    EstimationValue(value: '?', description: 'test description')
  ];

  static List<EstimationValue> fibonacciList = [
    EstimationValue(value: 1.toString(), description: 'test description'),
    EstimationValue(value: 2.toString(), description: 'test description'),
    EstimationValue(value: 3.toString(), description: 'test description'),
    EstimationValue(value: 5.toString(), description: 'test description'),
    EstimationValue(value: 8.toString(), description: 'test description'),
    EstimationValue(value: 13.toString(), description: 'test description'),
    EstimationValue(value: 21.toString(), description: 'test description'),
    EstimationValue(value: 34.toString(), description: 'test description'),
    EstimationValue(value: 55.toString(), description: 'test description'),
    EstimationValue(value: '∞', description: 'test description'),
    EstimationValue(value: '?', description: 'test description'),
  ];

  static const List<EstimationValue> tShirtList = [
    EstimationValue(value: 'XS', description: 'test description'),
    EstimationValue(value: 'S', description: 'test description'),
    EstimationValue(value: 'M', description: 'test description'),
    EstimationValue(value: 'L', description: 'test description'),
    EstimationValue(value: 'XL', description: 'test description'),
    EstimationValue(value: 'XXL', description: 'test description'),
    EstimationValue(value: '∞', description: 'test description'),
    EstimationValue(value: '?', description: 'test description'),
  ];
}
