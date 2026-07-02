{ profileInfo, nur, ... }:
{
  programs.librewolf = {
    enable = true;

    profiles."librewolf".extensions = {
      force = true;
      packages = with nur.legacyPackages.${profileInfo.system}.repos.rycee.firefox-addons; [
        ublock-origin
        proton-vpn
        a11ycss
      ];
    };

    policies = {
      AIControls = {
        Default = {
          Value = "blocked";
          Locked = true;
        };
      };
      AppAutoUpdate = false;
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      BrowserDataBackup = {
        AllowBackup = false;
        AllowRestore = false;
      };
      Cookies = {
        Behavior = "accept";
        BehaviorPrivateBrowsing = "reject";
      };
      DisableAppUpdate = true;
      DisableBuiltinPDFViewer = true;
      DisableFirefoxAccount = true;
      DisableFirefoxScreenshots = true;
      DisableFirefoxStudies = true;
      DisableFormHistory = true;
      DisableMasterPasswordCreation = true;
      DisablePasswordReveal = true;
      DisableRemoteImprovements = true;
      DisableSetDesktopBackground = true;
      DisableTelemetry = true;
      DisplayBookmarksToolbar = "newtab";
      DontCheckDefaultBrowser = true;
      DownloadDirectory = "/home/${profileInfo.user}/Downloads";
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
        EmailTracking = true;
        SuspectedFingerprinting = true;
        BaselineExceptions = true;
        ConvenienceExceptions = true;
      };
      ExtensionUpdate = true;
      GenerativeAI = {
        Enabled = false;
      };
      HardwareAcceleration = true;
      Homepage = {
        StartPage = "previous-session";
      };
      HttpsOnlyMode = "enabled";
      IPProtectionAvailable = false;
      NewTabPage = false;
      OfferToSaveLogins = false;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      PasswordManagerEnabled = false;
      PDFjs = {
        Enabled = false;
      };
      Permissions = {
        Camera = {
          BlockNewRequests = false;
          Locked = true;
        };
        Microphone = {
          BlockNewRequests = false;
          Locked = true;
        };
        Location = {
          BlockNewRequests = true;
          Locked = true;
        };
        Notifications = {
          BlockNewRequests = true;
          Locked = true;
        };
        Autoplay = {
          Default = "allow-audio-video";
          Locked = true;
        };
        VirtualReality = {
          BlockNewRequests = true;
          Locked = true;
        };
        ScreenShare = {
          BlockNewRequests = false;
          Locked = true;
        };
        PictureInPicture = {
          Enabled = false;
          Locked = true;
        };
        PopupBlocking = {
          Default = true;
          Locked = true;
        };
        PrintingEnabled = true;
        PromtForDownloadLocation = false;
        Proxy = {
          Mode = "system";
          Locked = true;
        };
        RequestedLocales = "en-US,ru";
        SanitizeOnShutdown = {
          Cache = true;
          Cookies = false;
          FormData = true;
          History = true;
          Sessions = false;
          SiteSettings = false;
          Locked = true;
        };
        SearchEngines = {
          Default = "DuckDuckGo";
          Remove = [
            "MetaGer"
            "Mojeek"
            "Searx Belgium"
            "DuckDuckGo Lite"
          ];
        };
        SearchSuggestEnabled = false;
        ShowHomeButton = false;
        SkipTermsOfUse = true;
        StartDownloadsInTempDirectory = false;
        TranslateEnabled = true;
        VisualSearchEnabled = true;
        WebsiteFilter = {
          Block = [ ];
          Exceptions = [ ];
        };
      };

      settings = {
        "security.csp.reporting.enabled" = false;
        "security.insecure_connection_text.enabled" = true;
        "security.insecure_connection_text.pbmode.enabled" = true;
        "security.warn_submit_secure_to_insecure " = true;
        "privacy.donottrackheader.enabled" = true;
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
        "browser.cache.disk.enable" = false;
        "browser.sessionhistory.max_entries" = 10;
        "extensions.pocket.enabled" = false;
      };

      languagePacks = [
        "ru"
      ];
    };
  };
}
