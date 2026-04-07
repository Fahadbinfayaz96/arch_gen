void main() {
  print('''
🚀 fd_arch_gen Usage Example

1. Activate package:
   dart pub global activate fd_arch_gen

2. Create a feature:
   fd_arch_gen feature auth --bloc

3. Generated structure:
   lib/features/auth/
     data/
     domain/
     presentation/

💡 Tip:
Use --riverpod if you prefer Riverpod instead of BLoC.
''');
}
