{ pkgs, lib, ... }: {
  # Complement your existing JetBrains account sync
  # Only manage system-level configs that don't sync
  
  home.file = {
    # Performance tuning - not synced by JetBrains
    ".idea/idea.vmoptions".text = ''
      -Xms2g
      -Xmx8g
      -XX:ReservedCodeCacheSize=3g
      -XX:+UseConcMarkSweepGC
      -XX:SoftRefLRUPolicyMSPerMB=50
      -ea
      -XX:CICompilerCount=2
      -Dsun.io.useCanonPrefixCache=false
      -Djdk.http.auth.tunneling.disabledSchemes=""
      -XX:+HeapDumpOnOutOfMemoryError
      -XX:-OmitStackTraceInFastThrow
      -Xverify:none
    '';
  };

  home.activation.jetbrainsInfo = lib.hm.dag.entryAfter ["writeBoundary"] ''
    echo "✅ JetBrains VM options configured"
    echo "💡 Your existing JetBrains account sync will handle:"
    echo "   - Themes, keymaps, code styles"
    echo "   - Plugin configurations"
    echo "   - Editor preferences"
    echo ""
    echo "🔧 Nix manages: VM performance settings only"
  '';
}
