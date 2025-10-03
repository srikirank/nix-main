{ pkgs, lib, ... }: {
  # Apple Account Setup Documentation
  # This cannot be automated due to security restrictions
  
  home.activation.appleAccountSetup = lib.hm.dag.entryAfter ["writeBoundary"] ''
    echo ""
    echo "🍎 MANUAL APPLE ACCOUNT SETUP REQUIRED"
    echo "======================================"
    echo ""
    echo "After Nix Darwin setup completes, manually configure:"
    echo ""
    echo "1. 🆔 Apple ID / iCloud:"
    echo "   • System Settings → Sign in with Apple ID"
    echo "   • Enable: iCloud Drive, Photos, Keychain, etc."
    echo "   • Configure: Find My, Screen Time, Family Sharing"
    echo ""
    echo "2. 🛍️  App Store:"
    echo "   • Open App Store app"
    echo "   • Sign in with Apple ID"
    echo "   • Apps will auto-download from your purchase history"
    echo ""
    echo "3. 📱 Additional Services:"
    echo "   • Messages: Enable iMessage"
    echo "   • FaceTime: Sign in for calls"
    echo "   • Mail: Add iCloud email account"
    echo ""
    echo "4. 🔐 Security:"
    echo "   • Enable FileVault (if not already enabled)"
    echo "   • Configure Touch ID for additional apps"
    echo "   • Review Privacy & Security settings"
    echo ""
    echo "💡 TIP: Use the same Apple ID across all devices for seamless sync"
    echo ""
  '';
}
