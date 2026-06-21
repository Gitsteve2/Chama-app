import 'package:chama/features/navigation_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'payment_confirmation_page.dart';
import 'transact_page.dart';

class SendToBankPage extends StatefulWidget {
  static String routeName = "/transact";

  @override
  State<SendToBankPage> createState() => _SendToBankPageState();
}

class _SendToBankPageState extends State<SendToBankPage> {
  int _selectedIndex = 0;
  String? _selectedRecipient;
  String? _selectedSender;
  String? _selectedOption;
  String? _selectedPaymentCat;
  String? _amount;
  bool _isRecipientSelected = false;
  bool _isAmountValid = false;
  bool _showTransactionLimitError = false;
  bool _showMinimumAmountError = false;

  String? _fullName;
  String? _accountName;
  String? _physicalAddress;
  String? _referenceNumber;
  bool _showAdditionalFields = false;

  bool _additionalFieldsVisible = false;

  bool isValidAmount = false;

  void _validateAmount() {
    if (_selectedRecipient == null) {
      setState(() {
        // _showTransactionLimitError = true;
        _showMinimumAmountError = false;
      });
    } else if (_amount != null && double.tryParse(_amount!)! < 100.00) {
      setState(() {
        // _showTransactionLimitError = false;
        _showMinimumAmountError = true;
      });
    } else {
      setState(() {
        // _showTransactionLimitError = false;
        _showMinimumAmountError = false;
        _isAmountValid = true;
      });
    }
  }

  void _onFloatingActionButtonPressed() {
    if (_isRecipientSelected) {
      setState(() {
        _showAdditionalFields = true;
        _fullName = "Dishon Polycap";
        _accountName = "0470235229261";
        _physicalAddress = "Nairobi, Kenya";
      });
      Navigator.pop(context); // Close the showModalBottomSheet
    }
  }

  TextEditingController _searchController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();
  TextEditingController recipientController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController accountNameController = TextEditingController();
  TextEditingController physicalAddressController = TextEditingController();
  TextEditingController referenceNumberController = TextEditingController();

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

    recipientController.addListener(() {
      setState(() {
        _isRecipientSelected = recipientController.text.isNotEmpty;
      });
    });

    amountController.addListener(() {
      setState(() {
        double? amount = double.tryParse(amountController.text);
        isValidAmount = amount != null && amount >= 100;
      });
    });

    // Simulate loading delay
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _accountNumberController.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
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
                          child: Text('Send to a bank account',
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
              // SizedBox(height: 9),
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
                                      )
                                          .animate()
                                          .fadeIn(
                                              duration:
                                                  Duration(milliseconds: 700))
                                          .scaleXY(
                                              begin: 0.4,
                                              end: 1,
                                              duration: 500.ms)
                                          .slideY(
                                              begin: 1.0,
                                              end: 0.0,
                                              curve: Curves.easeOut),
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
                    SizedBox(height: _selectedRecipient != null ? 5.0 : 0),
                    Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _showRecipientModal();
                          },
                          child: AbsorbPointer(
                            child: TextFormField(
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFa52b29),
                                    width: 2.0,
                                  ),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1.0,
                                  ),
                                ),
                                contentPadding: EdgeInsets.only(
                                  bottom: _selectedRecipient != null
                                      ? MediaQuery.of(context).size.height *
                                          0.035
                                      : 0,
                                  right:
                                      40, // Add padding to make room for the icon
                                ),
                                hintStyle: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.6,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                hintText: _selectedRecipient == null
                                    ? 'Enter recipient'
                                    : "$_fullName - $_accountName",
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a recipient';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        if (_selectedRecipient != null)
                          Positioned(
                            left: 0,
                            top: MediaQuery.of(context).size.height * 0.035,
                            child: Text(
                              "$_accountName",
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        Positioned(
                          right: 0,
                          top: MediaQuery.of(context).size.height * 0.015,
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.black,
                            size: 32,
                          ),
                        ),
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
                            'The minimum amount you can send is 100.00 KES.\nPlease try again.',
                            style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                color: Colors.red,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                      ),
                    Visibility(
                        visible: _additionalFieldsVisible ? false : true,
                        child: SizedBox(
                            height: _additionalFieldsVisible ? 22 : 40)),
                    Visibility(
                      visible: _additionalFieldsVisible ? false : true,
                      child: Text('Payment reason',
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                    ),
                    Visibility(
                      visible: _additionalFieldsVisible ? false : true,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: _additionalFieldsVisible
                              ? 'Required'
                              : 'Optional',
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
                      ),
                    ),
                    if (_additionalFieldsVisible) ...[
                      SizedBox(height: 22.0),
                      Text(
                          'Exchange rate 1 USD - 131.75 KES\nConverted amount 131.75 KES',
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                      SizedBox(height: _selectedRecipient != null ? 15.0 : 0),
                      Text('Apply a deal reference\nnumber?',
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18.2,
                              fontWeight: FontWeight.w400,
                            ),
                          )),
                      Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _showReferenceModal(context);
                            },
                            child: AbsorbPointer(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFa52b29),
                                      width: 2.0,
                                    ),
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context).size.height *
                                        0.085,
                                    right:
                                        40, // Add padding to make room for the icon
                                  ),
                                ),
                                validator: (value) {},
                              ),
                            ),
                          ),
                          if (_selectedRecipient != null)
                            Positioned(
                              left: 0,
                              top: 5,
                              child: Text(
                                "Enable to enter your deal reference\nnumber",
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          Positioned(
                            right: 0,
                            top: -5,
                            child: Row(
                              children: [
                                Transform.scale(
                                  scale: 0.8,
                                  child: CupertinoSwitch(
                                    value: false,
                                    onChanged: (value) {
                                      // setState(() {
                                      //   // _switchValue = value;
                                      // });
                                      _showReferenceModal(context);
                                    },
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _showReferenceInfoModal(context);
                                  },
                                  child: Transform.rotate(
                                    angle: 3.14,
                                    child: Icon(
                                      Icons.error_outline,
                                      size: 25,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            margin: EdgeInsets.only(top: 20, bottom: 0),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.1),
                        child: Text(
                          'Foreign bank charges',
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              final result = await showModalBottomSheet<String>(
                                context: context,
                                isScrollControlled: true,
                                builder: (BuildContext context) {
                                  return Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.88,
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
                                              icon: Icon(Icons.arrow_back_ios,
                                                  size: 20),
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
                                                'Charge option',
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
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.03),
                                        ListTile(
                                          title: Text(
                                            'Pay Full Charges',
                                            style: GoogleFonts.openSans(
                                              textStyle: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          subtitle: Text(
                                            'You will pay the full amount of the foreign bank charges',
                                            style: GoogleFonts.openSans(
                                              textStyle: TextStyle(
                                                height: 1.6,
                                                fontSize: 13.6,
                                                color: Colors.grey.shade600,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          onTap: () {
                                            Navigator.pop(
                                                context, 'Pay Full Charges');
                                          },
                                          trailing: Icon(Icons.radio_button_off,
                                              color: Color(0xFFa52b29)),
                                        ),
                                        Container(
                                          height: 1,
                                          margin: EdgeInsets.only(
                                              right: 5,
                                              left: 15,
                                              top: 2,
                                              bottom: 5),
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade300,
                                          ),
                                        ),
                                        ListTile(
                                          title: Text(
                                            'Share charges',
                                            style: GoogleFonts.openSans(
                                              textStyle: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          subtitle: Text(
                                            'We will deduct the foreign bank charges from what your recipient receives',
                                            style: GoogleFonts.openSans(
                                              textStyle: TextStyle(
                                                height: 1.6,
                                                fontSize: 13.6,
                                                color: Colors.grey.shade600,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          onTap: () {
                                            Navigator.pop(
                                                context, 'Share charges');
                                          },
                                          trailing: Icon(Icons.radio_button_off,
                                              color: Color(0xFFa52b29)),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );

                              if (result != null) {
                                setState(() {
                                  _selectedOption = result;
                                });
                              }
                            },
                            child: AbsorbPointer(
                              child: DropdownButtonFormField<String>(
                                value: _selectedOption,
                                hint: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  child: Text(
                                    _selectedOption ?? 'Select an option',
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
                                items: _selectedOption == null
                                    ? []
                                    : [
                                        DropdownMenuItem(
                                          value: _selectedOption,
                                          child: Text(
                                            _selectedOption!,
                                            style: GoogleFonts.openSans(
                                              textStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18.6,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
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
                                        0.01,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 22),
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
                          hintText: _additionalFieldsVisible
                              ? 'Required'
                              : 'Optional',
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
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.1),
                        child: Text(
                          'Payment category',
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              final result = await showModalBottomSheet<String>(
                                context: context,
                                isScrollControlled: true,
                                builder: (BuildContext context) {
                                  return Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.88,
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
                                              icon: Icon(Icons.arrow_back_ios,
                                                  size: 20),
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
                                                'Payment category',
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
                                        SizedBox(height: 10),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 18.0),
                                          child: Text(
                                              'Please select payment category',
                                              style: GoogleFonts.openSans(
                                                textStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 21,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              )),
                                        ),
                                        SizedBox(height: 5),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 18.0),
                                          child: Text(
                                            'These payment reasons are for CBK reporting purposes for buying and importing goods',
                                            style: GoogleFonts.openSans(
                                              textStyle: TextStyle(
                                                height: 1.6,
                                                fontSize: 13.6,
                                                color: Colors.grey.shade600,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 12,
                                              bottom: 22,
                                              left: 17,
                                              right: 5),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            child: TextField(
                                              controller: _searchController,
                                              onChanged: (text) {
                                                // setModalState(() {
                                                //   _startSearch(text);
                                                // });
                                              },
                                              decoration: InputDecoration(
                                                hintText: 'Search by category',
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
                                                          // setModalState(() {
                                                          //   _clearSearch();
                                                          // });
                                                        },
                                                      )
                                                    : Icon(Icons.search,
                                                        color: Colors
                                                            .grey.shade600),
                                                filled: true,
                                                fillColor: Colors.grey.shade100,
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFa52b29),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.014),
                                        Expanded(
                                          child: SingleChildScrollView(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                ListTile(
                                                  title: Text(
                                                    'Portfolio Investment in Foreign Trends',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.openSans(
                                                      textStyle: TextStyle(
                                                        fontSize: 17.5,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    Navigator.pop(context,
                                                        'Portfolio Investment in Foreign Trends');
                                                  },
                                                  trailing: Icon(
                                                      Icons.radio_button_off,
                                                      color: Color(0xFFa52b29)),
                                                ),
                                                Container(
                                                  height: 1,
                                                  margin: EdgeInsets.only(
                                                      right: 5,
                                                      left: 15,
                                                      bottom: 10),
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey.shade300,
                                                  ),
                                                ),
                                                ListTile(
                                                  title: Text(
                                                    'Food-Payment',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.openSans(
                                                      textStyle: TextStyle(
                                                        fontSize: 17.5,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    Navigator.pop(context,
                                                        'Food-Payment');
                                                  },
                                                  trailing: Icon(
                                                      Icons.radio_button_off,
                                                      color: Color(0xFFa52b29)),
                                                ),
                                                Container(
                                                  height: 1,
                                                  margin: EdgeInsets.only(
                                                      right: 5,
                                                      left: 15,
                                                      bottom: 10),
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey.shade300,
                                                  ),
                                                ),
                                                ListTile(
                                                  title: Text(
                                                    'Mineral Fuels(Oil Products) and Lubricants',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.openSans(
                                                      textStyle: TextStyle(
                                                        fontSize: 17.5,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    Navigator.pop(context,
                                                        'Mineral Fuels(Oil Products) and Lubricants');
                                                  },
                                                  trailing: Icon(
                                                      Icons.radio_button_off,
                                                      color: Color(0xFFa52b29)),
                                                ),
                                                Container(
                                                  height: 1,
                                                  margin: EdgeInsets.only(
                                                      right: 5,
                                                      left: 15,
                                                      bottom: 10),
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey.shade300,
                                                  ),
                                                ),
                                                ListTile(
                                                  title: Text(
                                                    'Raw Materials-Payments',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.openSans(
                                                      textStyle: TextStyle(
                                                        fontSize: 17.5,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    Navigator.pop(context,
                                                        'Raw Materials-Payments');
                                                  },
                                                  trailing: Icon(
                                                      Icons.radio_button_off,
                                                      color: Color(0xFFa52b29)),
                                                ),
                                                Container(
                                                  height: 1,
                                                  margin: EdgeInsets.only(
                                                      right: 5,
                                                      left: 15,
                                                      bottom: 10),
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey.shade300,
                                                  ),
                                                ),
                                                ListTile(
                                                  title: Text(
                                                    'Chemicals-Payments',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.openSans(
                                                      textStyle: TextStyle(
                                                        fontSize: 17.5,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    Navigator.pop(context,
                                                        'Chemicals-Payments');
                                                  },
                                                  trailing: Icon(
                                                      Icons.radio_button_off,
                                                      color: Color(0xFFa52b29)),
                                                ),
                                                Container(
                                                  height: 1,
                                                  margin: EdgeInsets.only(
                                                      right: 5,
                                                      left: 15,
                                                      bottom: 10),
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey.shade300,
                                                  ),
                                                ),
                                                ListTile(
                                                  title: Text(
                                                    'Manufactured Goods-Payments',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.openSans(
                                                      textStyle: TextStyle(
                                                        fontSize: 17.5,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    Navigator.pop(context,
                                                        'Manufactured Goods-Payments');
                                                  },
                                                  trailing: Icon(
                                                      Icons.radio_button_off,
                                                      color: Color(0xFFa52b29)),
                                                ),
                                                Container(
                                                  height: 1,
                                                  margin: EdgeInsets.only(
                                                      right: 5,
                                                      left: 15,
                                                      bottom: 10),
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey.shade300,
                                                  ),
                                                ),
                                                ListTile(
                                                  title: Text(
                                                    'Machineryand Transport Equipments',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.openSans(
                                                      textStyle: TextStyle(
                                                        fontSize: 17.5,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    Navigator.pop(context,
                                                        'Machineryand Transport Equipments');
                                                  },
                                                  trailing: Icon(
                                                      Icons.radio_button_off,
                                                      color: Color(0xFFa52b29)),
                                                ),
                                                Container(
                                                  height: 1,
                                                  margin: EdgeInsets.only(
                                                      right: 5,
                                                      left: 15,
                                                      bottom: 10),
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey.shade300,
                                                  ),
                                                ),
                                                ListTile(
                                                  title: Text(
                                                    'Other Imports Unclassified',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.openSans(
                                                      textStyle: TextStyle(
                                                        fontSize: 17.5,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    Navigator.pop(context,
                                                        'Other Imports Unclassified');
                                                  },
                                                  trailing: Icon(
                                                      Icons.radio_button_off,
                                                      color: Color(0xFFa52b29)),
                                                ),
                                                Container(
                                                  height: 1,
                                                  margin: EdgeInsets.only(
                                                      right: 5,
                                                      left: 15,
                                                      bottom: 10),
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey.shade300,
                                                  ),
                                                ),
                                                ListTile(
                                                  title: Text(
                                                    'Business Travel-Payments',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.openSans(
                                                      textStyle: TextStyle(
                                                        fontSize: 17.5,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    Navigator.pop(context,
                                                        'Business Travel-Payments');
                                                  },
                                                  trailing: Icon(
                                                      Icons.radio_button_off,
                                                      color: Color(0xFFa52b29)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );

                              if (result != null) {
                                setState(() {
                                  _selectedPaymentCat = result;
                                });
                              }
                            },
                            child: AbsorbPointer(
                              child: DropdownButtonFormField<String>(
                                value: _selectedPaymentCat,
                                hint: Text(
                                  _selectedPaymentCat ?? 'Select an option',
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17.5,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                items: _selectedPaymentCat == null
                                    ? []
                                    : [
                                        DropdownMenuItem(
                                          value: _selectedPaymentCat,
                                          child: Text(
                                            _selectedPaymentCat!,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.openSans(
                                              textStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18.6,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                onChanged: (value) {},
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.black,
                                  size: 32,
                                ),
                                isExpanded:
                                    true, // Ensures the DropdownButtonFormField expands properly
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFa52b29),
                                      width: 2.0,
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                    SizedBox(height: MediaQuery.of(context).size.height * 0.07),
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
            onPressed: _additionalFieldsVisible ? () {} : null,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.095,
              padding:
                  EdgeInsets.only(top: 14, bottom: 14, left: 24, right: 24),
              child: ElevatedButton(
                onPressed: _additionalFieldsVisible
                    ? () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PaymentConfirmPage()));
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _additionalFieldsVisible
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
                      color: _additionalFieldsVisible
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

  void _showReferenceInfoModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            // Adding listeners to text controllers

            return Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.88,
                  padding: EdgeInsets.only(
                      top: 10.0,
                      left: 4,
                      right: 16,
                      bottom: 70), // Adjust padding for FAB space
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Close icon and header
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 10,
                          right: 15,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.close,
                                  color: Colors.black, size: 22),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: Text(
                                'Deal reference number',
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
                        child: Text("What is a deal reference\nnumber?",
                            style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 20.5,
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                      ),
                      // Input fields
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0, right: 3),
                        child: Text(
                          'A deal reference number is a number provided by the bank for special foreign exchange rates',
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
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showReferenceModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            bool isButtonRed = referenceNumberController.text.isNotEmpty;

            void _handleTextChange() {
              setModalState(() {
                isButtonRed = referenceNumberController.text.isNotEmpty;
              });
            }

            // Adding listeners to text controllers
            referenceNumberController.addListener(_handleTextChange);

            return Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.88,
                  padding: EdgeInsets.only(
                      top: 10.0,
                      left: 4,
                      right: 16,
                      bottom: 70), // Adjust padding for FAB space
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Close icon and header
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 10,
                          right: 15,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.close,
                                  color: Colors.black, size: 22),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: Text(
                                'Deal reference number',
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
                        child: Text("Please enter your deal reference number",
                            style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 20.5,
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                      ),
                      // Input fields
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0, right: 3),
                        child: Text(
                          'Deal reference number',
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0, right: 3),
                        child: TextFormField(
                          controller: referenceNumberController,
                          cursorColor: Color(0xFFa52b29),
                          decoration: InputDecoration(
                            hintStyle: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 17.5,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            hintText: 'Enter your deal reference number',
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFa52b29), width: 2.0),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
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
                    onPressed: isButtonRed ? () {} : null,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.095,
                      decoration: BoxDecoration(
                        color: isButtonRed
                            ? Colors.black
                            : Color.fromRGBO(240, 240, 240, 0.5),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      // padding: EdgeInsets.only(
                      //     top: 14, bottom: 14, left: 24, right: 24),
                      margin: EdgeInsets.only(
                          top: 14, bottom: 14, left: 24, right: 24),
                      child: ElevatedButton(
                        onPressed: isButtonRed
                            ? () {
                                setState(() {
                                  _fullName = fullNameController.text;
                                  _accountName = accountNameController.text;
                                  _physicalAddress =
                                      physicalAddressController.text;
                                  _additionalFieldsVisible =
                                      true; // Show additional fields
                                  _selectedRecipient =
                                      "$_fullName ($_accountName)"; // Automatically populate
                                });
                                Navigator.pop(context);
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isButtonRed
                              ? Color(0xFFa52b29)
                              : Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text(
                          'Continue',
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: isButtonRed
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
              ],
            );
          },
        );
      },
    );
  }

  void _showBankAccountModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            bool isButtonRed = fullNameController.text.isNotEmpty &&
                accountNameController.text.isNotEmpty;

            void _handleTextChange() {
              setModalState(() {
                isButtonRed = fullNameController.text.isNotEmpty &&
                    accountNameController.text.isNotEmpty;
              });
            }

            // Adding listeners to text controllers
            fullNameController.addListener(_handleTextChange);
            accountNameController.addListener(_handleTextChange);

            return Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.88,
                  padding: EdgeInsets.only(
                      top: 10.0,
                      left: 4,
                      right: 16,
                      bottom: 70), // Adjust padding for FAB space
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Close icon and header
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 10,
                          right: 15,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.keyboard_arrow_left,
                                  color: Colors.black, size: 30),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: Text(
                                'Send to someone new',
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
                        child: Text("Please enter the recipient's details",
                            style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 20.5,
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                      ),
                      // Input fields
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0, right: 3),
                        child: TextFormField(
                          // controller: _fullNameController,
                          controller: fullNameController,
                          decoration: InputDecoration(
                            labelText: 'Full name',
                            labelStyle: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                color: Colors.grey.shade800,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            floatingLabelStyle: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                color: Color(0xFFa52b29),
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFa52b29), width: 2.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.014),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0, right: 3),
                        child: TextFormField(
                          controller: accountNameController,
                          decoration: InputDecoration(
                            labelText: 'Account or IBAN number',
                            labelStyle: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                color: Colors.grey.shade800,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            floatingLabelStyle: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                color: Color(0xFFa52b29),
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFa52b29), width: 2.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.014),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0, right: 3),
                        child: TextFormField(
                          controller: physicalAddressController,
                          decoration: InputDecoration(
                            labelText: 'Physical address',
                            labelStyle: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                color: Colors.grey.shade800,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            floatingLabelStyle: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                color: Color(0xFFa52b29),
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFa52b29), width: 2.0),
                            ),
                          ),
                        ),
                      ),
                    ],
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
                    onPressed: isButtonRed ? () {} : null,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.095,
                      decoration: BoxDecoration(
                        color: isButtonRed
                            ? Colors.black
                            : Color.fromRGBO(240, 240, 240, 0.5),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      // padding: EdgeInsets.only(
                      //     top: 14, bottom: 14, left: 24, right: 24),
                      margin: EdgeInsets.only(
                          top: 14, bottom: 14, left: 24, right: 24),
                      child: ElevatedButton(
                        onPressed: isButtonRed
                            ? () {
                                setState(() {
                                  _fullName = fullNameController.text;
                                  _accountName = accountNameController.text;
                                  _physicalAddress =
                                      physicalAddressController.text;
                                  _additionalFieldsVisible =
                                      true; // Show additional fields
                                  _selectedRecipient =
                                      "$_fullName ($_accountName)"; // Automatically populate
                                });
                                Navigator.pop(context);
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isButtonRed
                              ? Color(0xFFa52b29)
                              : Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text(
                          'Send money',
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: isButtonRed
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
              ],
            );
          },
        );
      },
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
                    child: ListView(
                      children: [
                        // Send to someone new
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey.shade200,
                            radius: 23,
                            child: Center(
                              child: SvgPicture.asset(
                                "assets/images/another.svg",
                                fit: BoxFit.cover,
                                color: Color(0xFFa52b29),
                                width: 31,
                              ),
                            ),
                          ),
                          title: Text('Send to a bank account',
                              style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                          trailing: Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.08),
                            child: Icon(Icons.arrow_forward_ios,
                                size: 18, color: Color(0xFFa52b29)),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            _showBankAccountModal(context);
                          },
                        ),
                        Container(
                          height: 1,
                          margin: EdgeInsets.only(
                              right: 5,
                              left: MediaQuery.of(context).size.width * 0.2,
                              top: 10,
                              bottom: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                          ),
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey.shade200,
                            radius: 23,
                            child: Center(
                              child: SvgPicture.asset(
                                "assets/images/link1.svg",
                                fit: BoxFit.cover,
                                color: Color(0xFFa52b29),
                                width: 34,
                              ),
                            ),
                          ),
                          title: Text('Send to a phone-linked account',
                              style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                          trailing: Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.08),
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
                              right: 5, left: 18, top: 2, bottom: 15),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                          ),
                        ),
                        // Favourites section (Placeholder)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 17.0),
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
                          padding: const EdgeInsets.symmetric(horizontal: 17.0),
                          child: Text('0 Favourites found',
                              style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                        ),
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
