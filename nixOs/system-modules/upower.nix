{
  services.upower = {
    enable = true;
    ignoreLid = true;

    usePercentageForPolicy = true;
    percentageLow = 15;
    percentageCritical = 5;
    percentageAction = 3;
    criticalPowerAction = "Hibernate";
  };
}
