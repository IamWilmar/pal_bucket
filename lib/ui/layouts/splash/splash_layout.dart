import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pal_bucket/bloc/auth/auth_cubit.dart';

class SplashLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    authCubit.isAuthenticated();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // AnimatedIconLoader(
            //   icon: Icons.mark_email_unread_outlined,
            //   iconSize: 300,
            // ),
            CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(
                Color(0xFF30169D),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Loading...',
              style: GoogleFonts.montserratAlternates(fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
