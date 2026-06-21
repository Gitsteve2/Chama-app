import 'package:chama/features/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart'; // Import the intl package

class ViewStatementPage extends StatefulWidget {
  static String routeName = "/transact";

  @override
  State<ViewStatementPage> createState() => _ViewStatementPageState();
}

class _ViewStatementPageState extends State<ViewStatementPage> {
  int _selectedDurationIndex = -1; // Default to none

  // For the custom date range
  DateTime? _startDate = DateTime.now().subtract(Duration(days: 365));
  DateTime? _endDate = DateTime.now();

  // Duration-based calculations
  final List<Map<String, dynamic>> _durations = [
    {'label': '1 Month', 'duration': Duration(days: 30)},
    {'label': '3 Months', 'duration': Duration(days: 90)},
    {'label': '6 Months', 'duration': Duration(days: 180)},
    {'label': '12 Months', 'duration': Duration(days: 365)},
    {'label': '2 Years', 'duration': Duration(days: 730)},
  ];

  // Custom DatePicker for past dates only
  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStartDate ? _startDate! : _endDate!,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(), // Disable future dates
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.red, // Red color for selected date
              onPrimary: Colors.white, // Text color for selected date
              onSurface: Colors.black, // Default color
            ),
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != (isStartDate ? _startDate : _endDate)) {
      setState(() {
        if (isStartDate) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }

  String get formattedStartDate {
    return DateFormat('dd MMM yyyy').format(_startDate!);
  }

  String get formattedEndDate {
    return DateFormat('dd MMM yyyy').format(_endDate!);
  }

  // Automatically calculate start date based on selected duration
  void _calculateDateRange(int index) {
    setState(() {
      _selectedDurationIndex = index;
      _endDate = DateTime.now(); // End date is always today
      _startDate = _endDate!.subtract(_durations[index]
          ['duration']); // Calculate start date based on selected duration
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('View your statement',
            style: GoogleFonts.openSans(
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            )),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Duration selection section
            Text('Select Duration',
                style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: _durations.asMap().entries.map((entry) {
                  int index = entry.key;
                  String label = entry.value['label'];
                  return _buildDurationButton(label, index);
                }).toList(),
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width * 0.39,
                  margin: EdgeInsets.only(
                    right: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text('OR',
                      style: TextStyle(fontSize: 14, color: Colors.grey)),
                ),
                Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width * 0.39,
                  margin: EdgeInsets.only(left: 18),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),

            // Custom date range section
            Text('Pick the date range',
                style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            SizedBox(height: 12),
            Column(
              children: [
                _buildDatePicker('Start date', _startDate!, (picked) {
                  setState(() {
                    _startDate = picked;
                  });
                }),
                SizedBox(height: 20),
                _buildDatePicker('End date', _endDate!, (picked) {
                  setState(() {
                    _endDate = picked;
                  });
                }),
              ],
            ),

            SizedBox(height: 24),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.095,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => NavigationMenu()));
              print(
                  'View Statement: Start: $formattedStartDate, End: $formattedEndDate');
            },
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.095,
              padding:
                  EdgeInsets.only(top: 14, bottom: 14, left: 24, right: 24),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFa52b29),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  onPressed: null,
                  child: Text(
                    'View',
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildDurationButton(String title, int index) {
    return GestureDetector(
      onTap: () {
        _calculateDateRange(index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 11, vertical: 8),
        margin: EdgeInsets.symmetric(horizontal: 6, vertical: 12),
        decoration: BoxDecoration(
          color: _selectedDurationIndex == index
              ? Color(0xFFa52b29)
              : Colors.grey.shade100,
          border: Border.all(
            color: _selectedDurationIndex == index
                ? Color(0xFFa52b29)
                : Colors.grey.shade100,
          ),
          borderRadius: BorderRadius.circular(3.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2), // Shadow color
              spreadRadius: 1, // Spread the shadow a bit
              blurRadius: 1, // Blur radius for smoothness
              offset: Offset(0,
                  1), // Offset for the raised effect (horizontal x, vertical y)
            ),
          ],
        ),
        child: Text(
          title,
          style: GoogleFonts.openSans(
            textStyle: TextStyle(
              color:
                  _selectedDurationIndex == index ? Colors.white : Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDatePicker(String labelText, DateTime selectedDate,
      Function(DateTime) onDateSelected) {
    final TextEditingController _dateController = TextEditingController(
      text: DateFormat('dd MMM yyyy').format(selectedDate),
    );

    return GestureDetector(
      onTap: () async {
        // Show date picker
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2000),
          lastDate: DateTime.now(),
          builder: (context, child) {
            return Theme(
              data: ThemeData.light().copyWith(
                colorScheme: ColorScheme.light(
                  primary: Color(0xFFa52b29),
                  outline: Color(0xFFa52b29),
                  primaryContainer: Colors.red, // Header background color
                  onSecondaryContainer: Colors.white,
                  onPrimary: Colors.white, // Header text color
                  onSurface: Colors.black, // Body text color
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor: Color(0xFFa52b29), // Button text color
                  ),
                ),
              ),
              child: child!,
            );
          },
        );

        if (pickedDate != null && pickedDate != selectedDate) {
          onDateSelected(pickedDate);
          _dateController.text = DateFormat('dd MMM yyyy').format(pickedDate);
        }
      },
      child: AbsorbPointer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              labelText,
              style: GoogleFonts.openSans(
                textStyle: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            TextFormField(
              controller: _dateController,
              decoration: InputDecoration(
                labelStyle: GoogleFonts.openSans(
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFa52b29),
                    width: 2.0,
                  ),
                ),
                border: UnderlineInputBorder(),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SvgPicture.asset(
                    "assets/images/clnd.svg",
                    // fit: BoxFit.cover,
                    color: Color(0xFFa52b29),
                    width: 1,
                  ),
                ),
              ),
              style: GoogleFonts.openSans(
                textStyle: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
