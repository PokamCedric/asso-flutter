import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final bool loading;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.loading = false,
  });

  Widget _buildLoading() {
    if (!loading) {
      return Container();
    }
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      width: 14,
      height: 14,
      child: const CircularProgressIndicator(strokeWidth: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: loading ? null : onPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(text),
          _buildLoading()
        ],
      ),
    );
  }
}
