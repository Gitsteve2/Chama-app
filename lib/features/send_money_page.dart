import 'package:chama/features/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'payment_confirmation_page.dart';
import 'transact_page.dart';

class SendMoneyPage extends StatefulWidget {
  static String routeName = "/transact";

  @override
  State<SendMoneyPage> createState() => _SendMoneyPageState();
}

class _SendMoneyPageState extends State<SendMoneyPage> {
  int _selectedIndex = 0;
  String? _selectedRecipient;
  String? _selectedSender;
  String? _amount;
  bool _isRecipientSelected = false;
  bool _isAmountValid = false;
  bool _showTransactionLimitError = false;
  bool _showMinimumAmountError = false;

  TextEditingController _searchController = TextEditingController();

  bool _isSearching = false;
  String _searchText = "";

  void _clearSearch() {
    setState(() {
      _isSearching = false;
      _searchText = "";
      _searchController.clear(); // Clears the text in the TextField
    });
  }

// Start the search and update the search state
  void _startSearch(String text) {
    setState(() {
      _isSearching = text.isNotEmpty;
      _searchText = text;
    });
  }

  List<String> _recents = [
    '254738734589',
    '254718976003',
    '254734498001',
    '254703457837',
  ];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    // Simulate loading delay
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      drawer: Drawer(
        child: ListView(children: []),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 15.0, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TransactPage()));
                      },
                      child: Container(
                        height: 47,
                        width: 47,
                        padding: EdgeInsets.only(right: 10, top: 2),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Icon(Icons.arrow_back_ios,
                              color: Colors.black, size: 20),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.129),
                          child: Text('Send mobile money',
                              style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                        )
                      ],
                    ),
                    Spacer()
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text('Please enter the payment details',
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
              ),
              SizedBox(height: 9),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Send from',
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    SizedBox(height: 10),
                    Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (BuildContext context) {
                                return Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.88,
                                  padding: EdgeInsets.only(
                                      top: 10.0,
                                      left: 4,
                                      right: 16,
                                      bottom: 16),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.close),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                          Spacer(),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                right: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.12),
                                            child: Text(
                                              'Pay from',
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
                                      SizedBox(height: 20),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 18.0),
                                        child: Text('Please select an account',
                                            style: GoogleFonts.openSans(
                                              textStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 21,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )),
                                      ),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.035),
                                      Container(
                                        padding: const EdgeInsets.only(
                                            bottom: 5.0, right: 5, top: 5),
                                        margin: const EdgeInsets.only(
                                          bottom: 20.0,
                                          left: 20,
                                          right: 5,
                                        ),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.grey.shade50,
                                            border: Border.all(
                                                color: Colors.grey.shade200,
                                                width: 2)),
                                        child: ListTile(
                                          leading: Padding(
                                            padding: EdgeInsets.only(
                                                bottom: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.042),
                                            child: Icon(
                                              Icons.check_circle,
                                              color: Color(0xFFa52b29),
                                            ),
                                          ),
                                          title: Text(
                                            'Dishon polycap',
                                            style: GoogleFonts.openSans(
                                              textStyle: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          subtitle: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 2),
                                              Text(
                                                'Available balance 47.24 KES',
                                                style: GoogleFonts.openSans(
                                                  textStyle: TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.black87,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                '0470235229261 • Savings',
                                                style: GoogleFonts.openSans(
                                                  textStyle: TextStyle(
                                                    fontSize: 12.5,
                                                    color: Colors.grey.shade600,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          onTap: () {
                                            setState(() {
                                              _selectedSender = '0470235229261';
                                            });
                                            Navigator.pop(context);
                                          },
                                          tileColor: Colors.grey.shade100,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                      // Add more ListTiles here if needed
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: AbsorbPointer(
                            child: DropdownButtonFormField<String>(
                              value: _selectedSender,
                              hint: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text(
                                  _selectedSender != null
                                      ? _selectedSender!
                                      : '0470235229261',
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.5,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                              items: [
                                DropdownMenuItem(
                                  value: '0470235229261',
                                  child: Text(
                                    '0470235229261',
                                    style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18.6,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                                // Add more items if needed
                              ],
                              onChanged: (value) {},
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.black,
                                size: 32,
                              ),
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFa52b29),
                                    width: 2.0,
                                  ),
                                ),
                                contentPadding: EdgeInsets.only(
                                  bottom: MediaQuery.of(context).size.height *
                                      0.045,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          bottom: 11,
                          child: Text(
                            'Available balance 480.96 KES',
                            style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 22.0),
                    Text('Send to',
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _showRecipientModal();
                          },
                          child: AbsorbPointer(
                            child: DropdownButtonFormField<String>(
                              value: _selectedRecipient,
                              hint: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text(
                                  _selectedRecipient != null
                                      ? _selectedRecipient!
                                      : 'Select the recipient',
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.5,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                              items: [
                                DropdownMenuItem(
                                  value: '254738734589',
                                  child: Text(
                                    '254738734589',
                                    style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                        color: Colors.grey.shade800,
                                        fontSize: 18.6,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                                // Add more items if needed
                              ],
                              onChanged: (value) {},
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.black,
                                size: 32,
                              ),
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFa52b29),
                                    width: 2.0,
                                  ),
                                ),
                                contentPadding: EdgeInsets.only(
                                  bottom: _selectedRecipient != null
                                      ? MediaQuery.of(context).size.height *
                                          0.045
                                      : 0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        _selectedRecipient != null
                            ? Positioned(
                                left: 0,
                                bottom: 11,
                                child: Text(
                                  'Mpesa',
                                  style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              )
                            : Spacer(),
                      ],
                    ),
                    SizedBox(height: 22.0),
                    Text('currency',
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
                          width: MediaQuery.of(context).size.width * 0.28,
                          child: DropdownButtonFormField<String>(
                            value: 'KES',
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
                            items: [
                              DropdownMenuItem(
                                value: 'KES',
                                child: Text('KES',
                                    style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )),
                              ),
                            ],
                            onChanged: (value) {},
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.black,
                              size: 32,
                            ),
                          ),
                        ),
                        SizedBox(width: 5.0),
                        Expanded(
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
                              setState(() {
                                _amount = value;
                                _validateAmount();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    if (_showTransactionLimitError)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text('Unable to get transaction limits',
                            style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                color: Colors.red,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                      ),
                    if (_showMinimumAmountError)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                            'The minimum amount you can send is 10.00 KES.\nPlease try again.',
                            style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                color: Colors.red,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                      ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.058),
                    Text('Payment reason',
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Optional',
                        hintStyle: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFa52b29), width: 2.0),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.095,
          // decoration: BoxDecoration(
          //   color: _isRecipientSelected && _isAmountValid
          //       ? Color(0xFFa52b29) // Red color when enabled
          //       : Colors.grey,
          //   borderRadius: BorderRadius.all(Radius.circular(2)),
          // ),
          child: FloatingActionButton(
            onPressed: _isRecipientSelected && _isAmountValid ? () {} : null,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.095,
              // decoration: BoxDecoration(
              //   color: _isRecipientSelected && _isAmountValid
              //       ? Color(0xFFa52b29) // Red color when enabled
              //       : Colors.grey,
              //   borderRadius: BorderRadius.all(Radius.circular(15)),
              // ),
              padding:
                  EdgeInsets.only(top: 14, bottom: 14, left: 24, right: 24),
              child: ElevatedButton(
                onPressed: _isRecipientSelected && _isAmountValid
                    ? () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PaymentConfirmPage()));
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isRecipientSelected && _isAmountValid
                      ? Color(0xFFa52b29) // Red color when enabled
                      : Colors.grey, // Grey color when disabled
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  'Send money',
                  style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                      color: _isRecipientSelected && _isAmountValid
                          ? Colors.white
                          : Colors.grey.shade500,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
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

  void _validateAmount() {
    if (_amount == null || _amount!.isEmpty) {
      setState(() {
        _isAmountValid = false;
        _showMinimumAmountError = false;
        _showTransactionLimitError = false;
      });
      return;
    }

    double? amount = double.tryParse(_amount!);

    if (!_isRecipientSelected) {
      setState(() {
        _showTransactionLimitError = true;
        _isAmountValid = false;
      });
      return;
    }

    if (amount != null && amount >= 10.0) {
      setState(() {
        _isAmountValid = true;
        _showMinimumAmountError = false;
        _showTransactionLimitError = false;
      });
    } else {
      setState(() {
        _isAmountValid = false;
        _showMinimumAmountError = true;
      });
    }
  }


  List<String> _getFilteredRecents() {
    if (_searchText.isEmpty) return _recents;
    return _recents.where((recent) => recent.contains(_searchText)).toList();
  }

  Widget _buildRecipientItem(String phoneNumber) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, left: 30),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Color(0xFFa52b29),
              radius: 21,
              child: Text('2',
                  style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 11.5,
                      fontWeight: FontWeight.w400,
                    ),
                  )),
            ),
            title: Text(
              phoneNumber,
              style: GoogleFonts.openSans(
                textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            subtitle: Text('Mpesa',
                style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            trailing: Radio(
              // overlayColor: Color(0xFFa52b29),
              activeColor: Color(0xFFa52b29),
              value: phoneNumber,
              groupValue: _selectedRecipient,
              onChanged: (value) {
                setState(() {
                  _selectedRecipient = value.toString();
                  _isRecipientSelected = true;
                  _showTransactionLimitError = false;
                  _validateAmount();
                });
                Navigator.pop(context);
              },
            ),
            onTap: () {
              setState(() {
                _selectedRecipient = phoneNumber;
                _isRecipientSelected = true;
                _showTransactionLimitError = false;
                _validateAmount();
              });
              Navigator.pop(context);
            },
          ),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width * 0.58,
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.09, bottom: 7),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
            ),
          ),
        ],
      ),
    );
  }

  void _showRecipientModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.88,
          padding: EdgeInsets.only(top: 10.0, left: 4, right: 16, bottom: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
          ),
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header with close icon
                  Padding(
                    padding: const EdgeInsets.only(
                      // top: 10,
                      bottom: 10,
                      right: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.close, color: Color(0xFFd21312)),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.1),
                          child: Text(
                            'Send to',
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
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, top: 10),
                    child: Text('Who are you sending money to?',
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 21,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                  ),
                  // Search field
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 12, bottom: 22, left: 17, right: 5),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: TextField(
                        controller: _searchController,
                        onChanged: (text) {
                          setModalState(() {
                            _startSearch(text);
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Search for a recipient',
                          contentPadding: EdgeInsets.only(
                            left: 15,
                            right: 15,
                            top: 4,
                            bottom: 10,
                          ),
                          hintStyle: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          suffixIcon: _isSearching
                              ? IconButton(
                                  icon: Icon(Icons.close),
                                  onPressed: () {
                                    setModalState(() {
                                      _clearSearch();
                                    });
                                  },
                                )
                              : Icon(Icons.search, color: Colors.grey.shade600),
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFa52b29),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: _isLoading
                        ? Center(
                            child: SpinKitCircle(
                              color: Color(0xFFa52b29),
                              size: 80.0,
                              duration: Duration(milliseconds: 1200),
                            ),
                          )
                        : ListView(
                            children: [
                              // Send to someone new
                              ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.grey.shade200,
                                  radius: 23,
                                  child: Center(
                                    child: SvgPicture.asset(
                                      "assets/images/send_to.svg",
                                      fit: BoxFit.cover,
                                      color: Color(0xFFa52b29),
                                      width: 31,
                                    ),
                                  ),
                                ),
                                title: Text('Send to someone new',
                                    style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )),
                                trailing: Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.08),
                                  child: Icon(Icons.arrow_forward_ios,
                                      size: 18, color: Color(0xFFa52b29)),
                                ),
                                onTap: () {
                                  // Handle send to someone new
                                },
                              ),
                              Container(
                                height: 1,
                                margin: EdgeInsets.only(
                                    right: 5, left: 18, top: 10, bottom: 15),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              // Favourites section (Placeholder)
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 17.0),
                                child: Text('Favourites',
                                    style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 21,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 17.0),
                                child: Text('0 Favourites found',
                                    style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )),
                              ),

                              // Recents section
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 17.0),
                                child: Text('Recents',
                                    style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 21,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )),
                              ),
                              ..._getFilteredRecents().isEmpty
                                  ? [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 17),
                                        child: Text('0 Recents found',
                                            style: GoogleFonts.openSans(
                                              textStyle: TextStyle(
                                                color: Colors.grey.shade500,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )),
                                      )
                                    ]
                                  : _getFilteredRecents()
                                      .map((item) => _buildRecipientItem(item)
                                          .animate()
                                          .fadeIn(
                                              duration:
                                                  Duration(milliseconds: 700))
                                          .scaleXY(
                                              begin: 0.4,
                                              end: 1.2,
                                              duration: 500.ms)
                                          .slideY(
                                              begin: 1.0,
                                              end: 0.0,
                                              curve: Curves.easeOut))
                                      .toList(),
                            ],
                          ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
