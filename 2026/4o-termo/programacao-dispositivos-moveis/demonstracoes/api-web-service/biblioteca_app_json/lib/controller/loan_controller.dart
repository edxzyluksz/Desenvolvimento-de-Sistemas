import 'package:biblioteca_app_json/model/loan.dart';
import 'package:biblioteca_app_json/service/api_service.dart';

class LoanController {
  Future<List<Loan>> fetchAll() async {
    final loans = await ApiService.getList("loans?_sort=loanDate");
    return loans.map<Loan>((item) => Loan.fromMap(item)).toList();
  }

  Future<Loan> create(Loan loan) async {
    final created = await ApiService.post("loans", loan.toMap());
    return Loan.fromMap(created);
  }

  Future<Loan> update(Loan loan) async {
    final update = await ApiService.put("loans", loan.toMap(), loan.id!);
    return Loan.fromMap(update);
  }
}