[Setting category="General" name="Enabled"]
bool S_Enabled = true;

[Setting category="General" name="Interval (minutes)" min=1 max=60]
uint S_Interval = 5;

void Main() {
    while (true) {
        sleep(1000);

        if (S_Enabled && Time::Stamp % (S_Interval * 60) == 0)
            Meta::SaveSettings();
    }
}

void OnSettingsChanged() {
    if (S_Interval == 0)
        S_Interval = 1;

    if (S_Interval > 60)
        S_Interval = 60;
}
