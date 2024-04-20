import 'package:flutter/material.dart';

import '../utilities/validations.dart';

class SuggestionList extends StatefulWidget {
  const SuggestionList({super.key,required
  this.matchingEmails, required this.fetchEmails, required this
      .emailController, required this.showSuggestions, required this.onSuggestionSelected});

  final List<String> matchingEmails;
  final Future<List<String>> fetchEmails;
  final TextEditingController emailController;
  final bool showSuggestions;
  final void Function(bool) onSuggestionSelected;

  @override
  State<SuggestionList> createState() => _SuggestionListState();
}

class _SuggestionListState extends State<SuggestionList> {
  String? selectedSuggestion;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.showSuggestions,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ]
        ),
        height: calculateContainerHeight(widget.matchingEmails.length),
        child: FutureBuilder<List<String>>(
          future: widget.fetchEmails,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              final List<String> allEmails = snapshot.data ?? [];
              final List<String> matchingEmails = allEmails.where((email) =>
                  email.startsWith(widget.emailController.text)).toList();
              return ListView.builder(
                itemCount: matchingEmails.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(matchingEmails[index],
                      style: const TextStyle(fontSize: 18.0),),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                    onTap: () {
                      setState(() {
                        widget.emailController.text = matchingEmails[index];
                        widget.onSuggestionSelected(false);
                        selectedSuggestion = matchingEmails[index]; //
                        // Keep track of selected suggestion
                      });
                    },
                  );
                },
              );
            }
          },
        ),

      ),
    );
  }
}
