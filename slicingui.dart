// slicingui.dart
import 'package:flutter/material.dart';

class SlicingUI extends StatefulWidget {
  const SlicingUI({super.key});

  @override
  State<SlicingUI> createState() => _SlicingUIState();
}

class _SlicingUIState extends State<SlicingUI> {
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  bool _obscure = true;

  @override
  void dispose() {
    _usernameCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF2D7EF7);
    const bg = Color(0xFFF3F6FB);

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Logo
                  Container(
                    width: 78,
                    height: 78,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF63A7FF),
                          Color(0xFF2D7EF7),
                        ],
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x22000000),
                          blurRadius: 18,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.store, color: Colors.white, size: 38),
                  ),

                  const SizedBox(height: 14),

                  const Text(
                    "Flutter POS",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF1A1F2C),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Point of Sale Offline",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF7B8798),
                    ),
                  ),

                  const SizedBox(height: 18),

                  // Card Login
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x14000000),
                          blurRadius: 24,
                          offset: Offset(0, 12),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          "Selamat Datang!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF1A1F2C),
                          ),
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          "Masukkan username dan password",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12.5,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF8B96A8),
                          ),
                        ),
                        const SizedBox(height: 14),

                        _InputField(
                          controller: _usernameCtrl,
                          hintText: "Username",
                          prefixIcon: Icons.person_outline,
                        ),
                        const SizedBox(height: 10),

                        _InputField(
                          controller: _passwordCtrl,
                          hintText: "Password",
                          prefixIcon: Icons.lock_outline,
                          obscureText: _obscure,
                          suffix: IconButton(
                            onPressed: () => setState(() => _obscure = !_obscure),
                            icon: Icon(
                              _obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                              color: const Color(0xFF98A2B3),
                            ),
                          ),
                        ),

                        const SizedBox(height: 14),

                        SizedBox(
                          height: 46,
                          child: ElevatedButton(
                            onPressed: () {
                              // TODO: handle login
                              FocusScope.of(context).unfocus();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryBlue,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              "Masuk",
                              style: TextStyle(fontSize: 14.5, fontWeight: FontWeight.w800),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Akun Demo box
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEAF3FF),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: const Color(0xFFCCE2FF)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Row(
                          children: [
                            Icon(Icons.info_outline, color: Color(0xFF2D7EF7), size: 18),
                            SizedBox(width: 8),
                            Text(
                              "Akun Demo",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF2D7EF7),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Admin : admin / admin123\nStaff : staff / staff123",
                          style: TextStyle(
                            height: 1.35,
                            fontSize: 12.5,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF2B3A55),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData prefixIcon;
  final bool obscureText;
  final Widget? suffix;

  const _InputField({
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    this.obscureText = false,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(0xFF9AA5B1),
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
        prefixIcon: Icon(prefixIcon, color: const Color(0xFF98A2B3)),
        suffixIcon: suffix,
        filled: true,
        fillColor: const Color(0xFFF2F4F7),
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: Color(0xFF1A1F2C),
      ),
    );
  }
}