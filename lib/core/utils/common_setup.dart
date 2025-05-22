import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> commonSetup() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imp2Y25qamd2b2Rua3JrYW1ocGdxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDc4NTQyNzgsImV4cCI6MjA2MzQzMDI3OH0.ziQAJGjWVZE95-BqhBiKlSknO835voY06DgozbtYdBg",
    url: "https://jvcnjjgvodnkrkamhpgq.supabase.co",
  );
}
