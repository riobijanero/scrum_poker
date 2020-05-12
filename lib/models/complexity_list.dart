import './scrum_complexity.dart';

class ComplexityList {
  static List<ScrumComplexity> standardList = [
    ScrumComplexity(complexityValue: 1.toString(), valueDescription: 'test description'),
    ScrumComplexity(complexityValue: 2.toString(), valueDescription: 'test description'),
    ScrumComplexity(complexityValue: 3.toString(), valueDescription: 'test description'),
    ScrumComplexity(complexityValue: 5.toString(), valueDescription: 'test description'),
    ScrumComplexity(complexityValue: 8.toString(), valueDescription: 'test description'),
    ScrumComplexity(complexityValue: 13.toString(), valueDescription: 'test description'),
    ScrumComplexity(complexityValue: 20.toString(), valueDescription: 'test description'),
    ScrumComplexity(complexityValue: 40.toString(), valueDescription: 'test description'),
    ScrumComplexity(complexityValue: 100.toString(), valueDescription: 'test description'),
    ScrumComplexity(complexityValue: '∞', valueDescription: 'test description'),
    ScrumComplexity(complexityValue: '?', valueDescription: 'test description')
  ];

  static List<ScrumComplexity> fibonacciList = [
    ScrumComplexity(complexityValue: 1.toString(), valueDescription: 'test description'),
    ScrumComplexity(complexityValue: 2.toString(), valueDescription: 'test description'),
    ScrumComplexity(complexityValue: 3.toString(), valueDescription: 'test description'),
    ScrumComplexity(complexityValue: 5.toString(), valueDescription: 'test description'),
    ScrumComplexity(complexityValue: 8.toString(), valueDescription: 'test description'),
    ScrumComplexity(complexityValue: 13.toString(), valueDescription: 'test description'),
    ScrumComplexity(complexityValue: 21.toString(), valueDescription: 'test description'),
    ScrumComplexity(complexityValue: 34.toString(), valueDescription: 'test description'),
    ScrumComplexity(complexityValue: 55.toString(), valueDescription: 'test description'),
    ScrumComplexity(complexityValue: '∞', valueDescription: 'test description'),
    ScrumComplexity(complexityValue: '?', valueDescription: 'test description'),
  ];

  static const List<ScrumComplexity> tShirtList = [
    ScrumComplexity(complexityValue: 'XS', valueDescription: 'test description'),
    ScrumComplexity(complexityValue: 'S', valueDescription: 'test description'),
    ScrumComplexity(complexityValue: 'M', valueDescription: 'test description'),
    ScrumComplexity(complexityValue: 'L', valueDescription: 'test description'),
    ScrumComplexity(complexityValue: 'XL', valueDescription: 'test description'),
    ScrumComplexity(complexityValue: 'XXL', valueDescription: 'test description'),
    ScrumComplexity(complexityValue: '∞', valueDescription: 'test description'),
    ScrumComplexity(complexityValue: '?', valueDescription: 'test description'),
  ];
}
