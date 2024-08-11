import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/controller/show_snackbar.dart';
import 'package:sottie_flutter/ui/common/widget/local_text_field.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("문의하기"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const LocalTextField(
                hint: "문의 내용을 작성해주세요",
                prefixIcon: false,
                lines: 12,
                maxLength: 250,
              ),
              SizedBox(height: 30 * hu),
              ElevatedButton(
                onPressed: () {
                  showSnackBar(context, "문의 내역을 전송하였습니다.");
                  context.pop();
                },
                child: const Text(
                  "문의하기",
                  style: TextStyle(
                    color: mainSilverColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
