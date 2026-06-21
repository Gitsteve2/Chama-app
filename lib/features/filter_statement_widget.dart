import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class FilterStatementWidget extends StatefulWidget {
  @override
  _FilterStatementWidgetState createState() => _FilterStatementWidgetState();
}

class _FilterStatementWidgetState extends State<FilterStatementWidget> {
  int _selectedDurationIndex = -1;
  DateTime? _startDate = DateTime.now().subtract(Duration(days: 365));
  DateTime? _endDate = DateTime.now();
  bool _isCustomSelected = false; // Track custom selection

  

  final List<Map<String, dynamic>> _durations = [
    {'label': 'Custom', 'duration': null}, // Custom button
    {'label': '1 Month', 'duration': Duration(days: 30)},
    {'label': '3 Months', 'duration': Duration(days: 90)},
    {'label': '6 Months', 'duration': Duration(days: 180)},
    {'label': '12 Months', 'duration': Duration(days: 365)},
    {'label': '2 Years', 'duration': Duration(days: 730)},
  ];

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStartDate ? _startDate! : _endDate!,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.red,
              onPrimary: Colors.white,
              onSurface: Colors.black,
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
        _isCustomSelected = true; // Mark custom selection
        _selectedDurationIndex = -1; // Deselect any predefined duration
      });
    }
  }

  String get formattedStartDate =>
      DateFormat('dd MMM yyyy').format(_startDate!);
  String get formattedEndDate => DateFormat('dd MMM yyyy').format(_endDate!);

  void _calculateDateRange(int index) {
    setState(() {
      _selectedDurationIndex = index;
      _endDate = DateTime.now();
      _startDate = _endDate!.subtract(_durations[index]['duration']);
      _isCustomSelected = false; // Unmark custom selection
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios, size: 20),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.12),
                      child: Text(
                        'Transaction filters',
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                Text('Set the filters to search your transaction history',
                    style: GoogleFonts.openSans(
                        fontSize: 21, fontWeight: FontWeight.w600)),
                SizedBox(height: 12),
                Text('Select date',
                    style: GoogleFonts.openSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFa52b29),
                    )),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _durations.asMap().entries.map((entry) {
                      int index = entry.key;
                      String label = entry.value['label'];
                      return _buildDurationButton(label, index);
                    }).toList(),
                  ),
                ),
                SizedBox(height: 24),
                Column(
                  children: [
                    _buildDatePicker('From', _startDate!, (picked) {
                      setState(() {
                        _startDate = picked;
                        _isCustomSelected = true;
                        _selectedDurationIndex = -1;
                      });
                    }),
                    SizedBox(height: 20),
                    _buildDatePicker('To', _endDate!, (picked) {
                      setState(() {
                        _endDate = picked;
                        _isCustomSelected = true;
                        _selectedDurationIndex = -1;
                      });
                    }),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Text('Enter Amount',
                    style: GoogleFonts.openSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFa52b29),
                    )),
                SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                Text('Minimum amount',
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.32,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.067,
                        padding: EdgeInsets.only(
                          top: 10.0,
                        ),
                        color: Colors.grey.shade100,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          decoration: InputDecoration(
                            hintText: 'KES',
                            hintStyle: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFa52b29), width: 2.0),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 15.0),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          decoration: InputDecoration(
                            hintText: 'Enter Amount',
                            hintStyle: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFa52b29), width: 2.0),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                Text('Maximum amount',
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.32,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.067,
                        padding: EdgeInsets.only(
                          top: 10.0,
                        ),
                        color: Colors.grey.shade100,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          decoration: InputDecoration(
                            hintText: 'KES',
                            hintStyle: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFa52b29), width: 2.0),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 15.0),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          decoration: InputDecoration(
                            hintText: 'Enter Amount',
                            hintStyle: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFa52b29), width: 2.0),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Text(
                    'Note: The search filter is limited to 6 months, if you require a more detailed history ...',
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.095,
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.8,
          ),
          // decoration: BoxDecoration(
          //   color: _isRecipientSelected && _isAmountValid
          //       ? Color(0xFFa52b29) // Red color when enabled
          //       : Colors.grey,
          //   borderRadius: BorderRadius.all(Radius.circular(2)),
          // ),
          child: FloatingActionButton(
            onPressed: null,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.095,
              decoration: BoxDecoration(
                color:Color.fromRGBO(240, 240, 240, 0.5),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              // padding: EdgeInsets.only(
              //     top: 14, bottom: 14, left: 24, right: 24),
              margin:
                  EdgeInsets.only(top: 14, bottom: 14, left: 24, right: 24),
              child: ElevatedButton(
                onPressed:  null,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Color(0xFFa52b29) ,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  'Continue',
                  style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                      color:
                       Colors.white ,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDurationButton(String title, int index) {
    return GestureDetector(
        onTap: () {
          if (index == 0) {
            // Custom button tapped
            setState(() {
              _isCustomSelected = true;
              _selectedDurationIndex = -1;
            });
          } else {
            _calculateDateRange(index);
          }
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                color: (_selectedDurationIndex == index ||
                        (index == 0 && _isCustomSelected))
                    ? Color(0xFFa52b29)
                    : Colors.grey.shade300),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Text(title,
              style: GoogleFonts.openSans(
                textStyle: TextStyle(
                  color: (_selectedDurationIndex == index ||
                          (index == 0 && _isCustomSelected))
                      ? Color(0xFFa52b29)
                      : Colors.black,
                  fontSize: 16.5,
                  fontWeight: FontWeight.w600,
                ),
              )),
        ));
  }

  Widget _buildDatePicker(String labelText, DateTime selectedDate,
      Function(DateTime) onDateSelected) {
    final TextEditingController _dateController = TextEditingController(
      text: DateFormat('dd MMM yyyy').format(selectedDate),
    );

    return GestureDetector(
      onTap: () async {
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
                  onPrimary: Colors.white,
                  onSurface: Colors.black,
                ),
                textButtonTheme: TextButtonThemeData(
                  style:
                      TextButton.styleFrom(foregroundColor: Color(0xFFa52b29)),
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
            Text(labelText,
                style: GoogleFonts.openSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade600)),
            SizedBox(height: 8.0),
            TextFormField(
              controller: _dateController,
              decoration: InputDecoration(
                labelStyle: GoogleFonts.openSans(
                    fontSize: 20, fontWeight: FontWeight.w500),
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFFa52b29), width: 2.0)),
                border: UnderlineInputBorder(),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SvgPicture.asset("assets/images/clnd.svg",
                      color: Color(0xFFa52b29), width: 1),
                ),
              ),
              style: GoogleFonts.openSans(
                  fontSize: 17, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
