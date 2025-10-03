{ pkgs, ... }: {
  
  enable = true;
    
  settings = {
    default = {
      region = "us-west-2";
      output = "json";
    };

#    "profile darkstar-beta" = {
#      sso_session = "stelo";
#      sso_account_id = "226776128672";
#      sso_role_name = "AdminAccess";
#      region = "us-west-2";
#      output = "json";
#    };
  };
} 