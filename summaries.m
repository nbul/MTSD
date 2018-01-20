%% Writing down summarised data MTSD

cd(result_dir);

summary = zeros(length(SD),8);
for counter2 = 1:length(SD)
    summary(counter2,1) = counter2;
end
summary(:,2) = cell_data(:,3); % cell area
summary(:,3) = cell_data(:,4); % eccentricity
summary(:,4) = cell_data(:,5); % cell orientation
summary(:,5) = SD';
summary(:,6) = mu';
summary(summary(:,6)<0,6) = summary(summary(:,6)<0,6) + 180;
summary(:,7) = 1./sqrt(1-cell_data(:,4).*cell_data(:,4));
summary(:,8) = 100*(erf(10./SD'/sqrt(2))-erf(-10./SD'/sqrt(2)))/2;
outlier_area = isoutlier(summary(:,2), 'median');
outlier_ecc = outlier_area + isoutlier(summary(:,3), 'median');
outlier_SD = outlier_ecc + isoutlier(summary(:,5), 'median');
outlier_number = length(outlier_SD(outlier_SD ~= 0));
summary(outlier_SD ~= 0,:) = [];
summary_filename = [num2str(Number),'_summary_MTSD.csv'];
headers2 = {'Cell', 'Area', 'Eccentricity','Direction_cell', ...
    'SD', 'DEV', 'Elongation', 'Alignment'};
csvwrite_with_headers(summary_filename,summary,headers2);
Averages(loop,1) = Number;
% cell area
Averages(loop,2) = mean(summary(:,2));
Averages(loop,3) = sqrt(var(summary(:,2))/length(summary(:,2)));
% eccentricity
Averages(loop,4) = mean(summary(:,3));
Averages(loop,5) = sqrt(var(summary(:,3))/length(summary(:,3)));
% cell orientation
Averages(loop,6) = mean(summary(:,4));
Averages(loop,7) = sqrt(var(summary(:,4))/length(summary(:,4)));
% SD
Averages(loop,8) = mean(summary(:,5));
Averages(loop,9) = sqrt(var(summary(:,5))/length(summary(:,5)));
% Direction cytoskeleton
Averages(loop,10) = mean(summary(:,6));
Averages(loop,11) = sqrt(var(summary(:,6))/length(summary(:,6)));
% cell elongation
Averages(loop,12) = mean(summary(:, 7));
Averages(loop,13) = sqrt(var(summary(:, 7))/length(summary(:, 7)));
% alignment
Averages(loop,14) = mean(summary(:, 8));
Averages(loop,15) = sqrt(var(summary(:, 8))/length(summary(:, 8)));
Averages(loop,16) = length(summary(:,1));
Averages(loop,17) = outlier_number;

cd(currdir);