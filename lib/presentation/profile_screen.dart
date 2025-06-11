import 'dart:convert';

import 'package:apiexample/core/api_requests.dart';
import 'package:apiexample/model/user_profile_model.dart';
import 'package:apiexample/utils/custom_snackbar.dart';
import 'package:apiexample/utils/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isLoading = false;
  UserProfileModel? currentUserProfile;

  Future<void> _fetchUserDetails({required int userId}) async {
    setState(() {
      isLoading = true;
    });
    final response =
        await http.get(Uri.parse('${ApiRequests.getUserProfile}/$userId'));

    if (response.statusCode == 200) {
      currentUserProfile = UserProfileModel.fromJson(jsonDecode(response.body));
    } else {
      CustomSnackbar.failureSnackBar(
        context: context,
        message: "Failed to fetch user details: ${response.reasonPhrase}",
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    final userId = SharedPrefs.getIntValue(key: SharedPrefs.userIdKey);
    if(userId == null) {
      CustomSnackbar.failureSnackBar(
        context: context,
        message: "User ID not found. Please log in again.",
      );
      return;
    }
    _fetchUserDetails(userId: userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : currentUserProfile != null
                ? Column(
                    children: [
                      Text(currentUserProfile!.username),
                      Text(
                          '${currentUserProfile!.name.firstname} ${currentUserProfile!.name.lastname}'),
                      Text(currentUserProfile!.phone),
                      Text(currentUserProfile!.email),
                      Text(currentUserProfile!.password),
                    ],
                  )
                : const Text('Fetching user details...'),
      ),
    );
  }
}
