import 'src/api_model/tenant_permissions.dart' as api_mod__tenant_permissions;
import 'src/api_model/address_book.dart' as api_mod__address_book;
import 'src/api_model/dashboard_widget.dart' as api_mod__dashboard_widget;
import 'src/api_model/document.dart' as api_mod__document;
import 'src/api_model/recent_documents.dart' as api_mod__recent_documents;
import 'src/api_model/user.dart' as api_mod__user;
import 'src/model/tenant_permissions.dart' as mod__tenant_permissions;
import 'src/model/address_book.dart' as mod__address_book;
import 'src/model/dashboard_widget.dart' as mod__dashboard_widget;
import 'src/model/document.dart' as mod__document;
import 'src/model/recent_documents.dart' as mod__recent_documents;
import 'src/model/user.dart' as mod__user;
import 'src/nucleus_one.dart' as n1;
import 'src/common/string.dart' as common_string;
import 'src/http.dart' as http;

void main() {
  n1.main();
  _apiModelTests();
  _commonTests();
  _modelTests();
  http.main();
}

void _apiModelTests() {
  api_mod__tenant_permissions.main();
  api_mod__address_book.main();
  api_mod__dashboard_widget.main();
  api_mod__document.main();
  api_mod__recent_documents.main();
  api_mod__user.main();
}

void _modelTests() {
  mod__tenant_permissions.main();
  mod__address_book.main();
  mod__dashboard_widget.main();
  mod__document.main();
  mod__recent_documents.main();
  mod__user.main();
}

void _commonTests() {
  common_string.main();
}
