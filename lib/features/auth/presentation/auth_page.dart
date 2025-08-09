import 'package:flutter/material.dart';
import '../../../core/widgets/glass_container.dart';
import '../../../core/widgets/aurora_background.dart';
import '../../../core/widgets/glass_button.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLogin = true;

  void _toggle() => setState(() => _isLogin = !_isLogin);

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.of(context).pushReplacementNamed('/dashboard');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: AuroraBackground(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: GlassContainer(
                opacity: 0.10,
                blur: 24,
                borderRadius: BorderRadius.circular(24),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 420),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            _isLogin ? 'Welcome back' : 'Create account',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            style: const TextStyle(color: Colors.white),
                            decoration: _inputDecoration('Email'),
                            validator: (v) => (v == null || v.isEmpty) ? 'Enter email' : null,
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            obscureText: true,
                            style: const TextStyle(color: Colors.white),
                            decoration: _inputDecoration('Password'),
                            validator: (v) => (v == null || v.length < 6) ? 'Min 6 chars' : null,
                          ),
                          if (!_isLogin) ...[
                            const SizedBox(height: 12),
                            TextFormField(
                              obscureText: true,
                              style: const TextStyle(color: Colors.white),
                              decoration: _inputDecoration('Confirm Password'),
                              validator: (v) => (v == null || v.length < 6) ? 'Min 6 chars' : null,
                            ),
                          ],
                          const SizedBox(height: 20),
                          GlassButton(
                            onPressed: _submit,
                            child: Text(_isLogin ? 'Log in' : 'Sign up'),
                          ),
                          const SizedBox(height: 8),
                          TextButton(
                            onPressed: _toggle,
                            child: Text(
                              _isLogin ? "Don't have an account? Sign up" : 'Already have an account? Log in',
                              style: const TextStyle(color: Colors.white70),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.white70),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Colors.white),
      ),
      filled: true,
      fillColor: Colors.white.withOpacity(0.06),
    );
  }
}
