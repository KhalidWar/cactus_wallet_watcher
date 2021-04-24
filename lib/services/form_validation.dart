class FormValidation {
  String validateAddWallet(String input) {
    if (input.isEmpty || input == null) {
      return 'Please provide a valid Eth Wallet Address';
    }
    return null;
  }
}
