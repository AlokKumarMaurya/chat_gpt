import 'package:get/get.dart';

class AllListController extends GetxController {
  String _currentTitle = "Empty";
  List<String> _currentList = [];

  String get currentTitle => _currentTitle;

  List<String> get currentList => _currentList;

  Map<String, List<String>> allContentList = {
    "Business": [
      "Do I have what it takes to own/manage a small business?",
      "What business should I choose?",
      "What is a business plan and why do I need one?",
      "Why do I need to define my business in detail?",
      "What legal aspects do I need to consider?",
      "What do I need to succeed in a business?"
    ],
    "Content": [
      "Should we do this? ",
      "What is content marketing?",
      "Does content marketing work?",
      "How does marketing without talking about or promoting our product/service help us create leads and sales?"
    ],
    "web Development": [
      "What is the difference between SOAP and REST?",
      "What is the use of a namespace in Web Development?",
      "What are the newly introduced input types in HTML5?",
      "What are the five elements that support media content in HTML5?",
      "What is SVG and why is it used?"
    ],
    "HealthCare": [
      "Why do I get sick?",
      "How do the disease-causing germs invade my body? ",
      "What does the immune system do?",
      "What is the difference between bacteria and viruses?"
    ],
    "Teachers": [
      "Why did you decide to become a teacher?",
      "What is your teaching philosophy?",
      "What type of classroom management structure would you implement if you were hired?"
    ],
    "Marketing": [
      "Why are you interested in a career in marketing?",
      "What is a marketing trend or campaign you liked? ",
      "What do you think of our recent marketing campaign?"
    ]
  };

  void setCurrentPage({required String title}) {
    _currentTitle = title;
    setCurrentList();
  }

//"Marketing","Bussiness","Content","web Development","HealthCare","Teachers"

  setCurrentList() {
    _currentList = allContentList[_currentTitle]!;
  }
}
