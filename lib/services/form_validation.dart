class FormValidation {
  String validateWalletAddress(String input) {
    if (input.isEmpty || input == null) {
      return 'Provide Wallet Address';
    }
    return null;
  }

  String validateWalletLabel(String input) {
    if (input.isEmpty || input == null) {
      return 'Provide Wallet label';
    }
    return null;
  }
}
