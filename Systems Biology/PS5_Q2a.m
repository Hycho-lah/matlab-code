
SD_med = std(hr_med);
entropy_med = apen(hr_med,2,0.2*SD_med);

SD_pre = std(hr_pre);
entropy_pre = apen(hr_pre,2,0.2*SD_pre);