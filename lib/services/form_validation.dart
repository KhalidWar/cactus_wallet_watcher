class FormValidation {
  String validateWalletAddress(String input) {
    if (input.isEmpty || input == null) {
      return 'Provide Wallet Address';
    } else if (input.length < 42) {
      return 'Invalid Wallet Address';
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
