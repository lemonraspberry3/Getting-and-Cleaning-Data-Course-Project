---
title: "Code Book run_analysis"
author: "lemonraspberry3"
date: "5/6/2020"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

# Variables in tidy_dataset.txt
## Variable Descriptions
1. **subjectid**: Volunteer participants in the study were assigned a number (from 1 to 30). This variable indicates which participant the data come from.
2. **activity**: Each participant executed six activities: walking, walking upstairs, walking downstairs, sitting, standing, or laying. This variable indicates what activity the participant was partaking in when corresponding measurements were made.
3. **mean_body_acc_x**: average of the body component of acceleration in the X direction
4. **mean_body_acc_y**: average of the body component of acceleration in the Y direction
5. **mean_body_acc z**: average of the body component of acceleration in the Z direction
6. **mean_gravity_acc_x**: average of the gravity component of acceleration in the X direction
7. **mean_gravity_acc_y**: average of the gravity component of acceleration in the Y direction
8. **mean_gravity_acc_z**: average of the gravity component of acceleration in the Z direction
9. **mean_body_acc_jerk_x**: average change over time of the body component of acceleration in the X direction (The body component of acceleration in the X direction was derived in time to obtain a jerk signal and the average of those values was taken.)
10. **mean_body_acc_jerk_y**: average change over time of the body component of acceleration in the Y direction (The body component of acceleration in the Y direction was derived in time to obtain a jerk signal and the average of those values was taken.)
11. **mean_body_acc_jerk_z**: average change over time of the body component of acceleration in the Z direction (The body component of acceleration in the Z direction was derived in time to obtain a jerk signal and the average of those values was taken.)
12. **mean_body_orient_x**: average body orientation in the X direction
13. **mean_body_orient_y**: average body orientation in the Y direction
14. **mean_body_orient_z**: average body orientation in the Z direction
15. **mean_body_orient_jerk_x**: average change over time in body orientation in the X direction (The angular velocity in the X direction was derived over time to obtain the jerk signal.)
16. **mean_body_orient_jerk_y**: average change over time in body orientation in the Y direction (The angular velocity in the Y direction was derived over time to obtain the jerk signal.)
17. **mean_body_orient_jerk_z**: average change over time in body orientation in the Z direction (The angular velocity in the Z direction was derived over time to obtain the jerk signal.)
18. **mean_body_acc**: average of the overall magnitude of the body component of acceleration (calculated using the Euclidean norm of the body component of acceleration in the X, Y, and Z directions)
19. **mean_gravity_acc**: average of the overall magnitude of the gravity component of acceleration (calculated using the Euclidean norm of the gravity component of acceleration in the X, Y, and Z directions)
20. **mean_body_acc_jerk**: average of the overall magnitude of the change in the body component of acceleration over time (calculated using the Euclidean norm of the derived body component of acceleration in the X, Y, and Z directions)
21. **mean_body_orient**: average of the overall body orientation (calculated using the Euclidean norm of the angular velocity in the X, Y, and Z directions)
22. **mean_body_orient_jerk**: average of the overall change in body orientation over time (calculated using the Euclidean norm of the derived angular velocity in the X, Y, and Z directions)
23. **f_mean_body_acc_x**: average Fourier transform of the body component of acceleration in the X direction
24. **f_mean_body_acc_y**: average Fourier transform of the body component of acceleration in the X direction
25. **f_mean_body_acc_z**: average Fourier transform of the body component of acceleration in the X direction
26. **f_mean_body_acc_jerk_x**: average Fourier transform of the change over time of the body component of acceleration in the X direction (Fourier transform of the body component of acceleration in the X direction derived over time)
27. **f_mean_body_acc_jerk_y**: average Fourier transform of the change over time of the body component of acceleration in the Y direction (Fourier transform of the body component of acceleration in the Y direction derived over time)
28. **f_mean_body_acc_jerk_z**: average Fourier transform of the change over time of the body component of acceleration in the Z direction (Fourier transform of the body component of acceleration in the Z direction derived over time)
29. **f_mean_body_orient_x**: average Fourier transform of body orientation in the X direction
30. **f_mean_body_orient_y**: average Fourier transform of body orientation in the Y direction
31. **f_mean_body_orient_z**: average Fourier transform of body orientation in the Z direction
32. **f_mean_body_acc**: average of the overall magnitude of the Fourier transform of the body component of acceleration (calculated using the Euclidean norm of the Fourier transforms of the body component of acceleration in the X, Y, and Z directions)
33. **f_mean_body_acc_jerk**: average of the overall magnitude of the Fourier transform of the change in the body component of acceleration over time (calculated using the Euclidean norm of the Fourier transforms of the derived values of the body component of acceleration in the X, Y, and Z directions)
34. **f_mean_body_orient**: average of the overall magnitude of the Fourier transform of body orientation (calculated using the Euclidean norm of the Fourier transforms of angular velocity in the X, Y, and Z directions)
35. **f_mean_body_orient_jerk**: average of the overall magnitude of the Fourier transform of the change in body orientation over time (calculated using the Euclidean norm of the Fourier transforms of the derived angular velocities in the X, Y, and Z directions)
36. **sd_body_acc_x**: standard deviation of the body component of acceleration in the X direction
37. **sd_body_acc_y**: standard deviation of the body component of acceleration in the Y direction
38. **sd_body_acc_Z**: standard deviation of the body component of acceleration in the Z direction
39. **sd_gravity_acc_x**: standard deviation of the gravity component of acceleration in the X direction
40. **sd_gravity_acc_y**: standard deviation of the gravity component of acceleration in the Y direction
41. **sd_gravity_acc_z**: standard deviation of the gravity component of acceleration in the Z direction
42. **sd_body_acc_jerk_x**: standard deviation of the change in the body component of acceleration in the X direction over time (the body component of acceleration in the X direction was derived over time)
43. **sd_body_acc_jerk_y**: standard deviation of the change in the body component of acceleration in the Y direction over time (the body component of acceleration in the Y direction was derived over time)
44. **sd_body_acc_jerk_z**: standard deviation of the change in the body component of acceleration in the Z direction over time (the body component of acceleration in the Z direction was derived over time)
45. **sd_body_orient_x**: standard deviation of the body orientation in the x direction
46. **sd_body_orient_y**: standard deviation of the body orientation in the Y direction
47. **sd_body_orient_z**: standard deviation of the body orientation in the Z direction
48. **sd_body_orient_jerk_x**: standard deviation of the change in the body orientation in the X direction over time (the angular velocity in the X direction was derived over time)
49. **sd_body_orient_jerk_y**: standard deviation of the change in the body orientation in the Y direction over time (the angular velocity in the Y direction was derived over time)
50. **sd_body_orient_jerk_z**: standard deviation of the change in the body orientation in the Z direction over time (the angular velocity in the Z direction was derived over time)
51. **sd_body_acc**: standard deviation of the overall magnitude of the body component of acceleration (calculated using the Euclidean norm of the body component of acceleration in the X, Y, and Z directions)
52. **sd_gravity_acc**: standard deviation of the overall magnitude of the gravity component of acceleration (calculated using the Euclidean norm of the gravity component of acceleration in the X, Y, and Z directions)
53. **sd_body_acc_jerk**: standard deviation of the overall magnitude of the change over time of the body component of acceleration (calculated using the Euclidean norm of the derived values of the body component of acceleration in the X, Y, and Z directions)
54. **sd_body_orient**: standard deviation of the overall body orientation (calculated using the Euclidean norm of the angular velocities in the X, Y, and Z directions) 
55. **sd_body_orient_jerk**: standard deviation of the overall magnitude of the change in body orientation over time (calculated using the Euclidean norm of the derived angular velocities in the X, Y, and Z directions)
56. **f_sd_body_acc_x**: standard deviation of the Fourier transform of the body component of acceleration in the X direction
57. **f_sd_body_acc_y**: standard deviation of the Fourier transform of the body component of acceleration in the Y direction
58. **f_sd_body_acc_z**: standard deviation of the Fourier transform of the body component of acceleration in the Z direction
59. **f_sd_body_acc_jerk_x**: standard deviation of the Fourier transform of the change over time of the body component of acceleration in the X direction (Fourier transform of the body component of acceleration in the X direction derived over time)
60. **f_sd_body_acc_jerk_y**: standard deviation of the Fourier transform of the change over time of the body component of acceleration in the Y direction (Fourier transform of the body component of acceleration in the Y direction derived over time)
61. **f_sd_body_acc_jerk_z**: standard deviation of the Fourier transform of the change over time of the body component of acceleration in the Z direction (Fourier transform of the body component of acceleration in the Z direction derived over time)
62. **f_sd_body_orient_x**: standard deviation of the Fourier transform of body orientation in the X direction
63. **f_sd_body_orient_y**: standard deviation of the Fourier transform of body orientation in the Y direction
64. **f_sd_body_orient_z**: standard deviation of the Fourier transform of body orientation in the Z direction
65. **f_sd_body_acc**: standard deviation of the Fourier transform of the overall magnitude of the body component of acceleration (Fourier transform of the Euclidean norm of the body component of acceleration in XYZ)
66. **f_sd_body_acc_jerk**: standard deviation of the Fourier transform of the overall magnitude of the change in the body component of acceleration over time (Fourier transform of the Euclidean norm of the derived body component of acceleration in XYZ)
67. **f_sd_body_orient**: standard deviation of the Fourier transform of the overall body orientation (Fourier transform of the Euclidean norm of angular velocities in XYZ)
68. **f_sd_body_orient_jerk**: standard deviation of the Fourier transform of the overall change in body orientation over time (Fourier transform of the Euclidean norm of derived angular velocities in XYZ)

## Summaries Calculated
The variables listed above are means and standard deviations of values in the original UCI HAR Dataset. These summaries were calculated per subject per activity using the aggregate() function in the stats package in R. Thus, each subject has six values for each mean or standard deviation variable, each corresponding to one of the six activities they performed.

## Variable Units
1. **subjectid**: no units - an integer variable
2. **activity**: no units - a factor variable
3. **mean_body_acc_x**: standard gravity units 'g'
4. **mean_body_acc_y**: standard gravity units 'g'
5. **mean_body_acc_z**: standard gravity units 'g'
6. **mean_gravity_acc_x**:  standard gravity units 'g'
7. **mean_gravity_acc_y**:  standard gravity units 'g'
8. **mean_gravity_acc_z**:  standard gravity units 'g'
9. **mean_body_acc_jerk_x**: gravity units/second
10. **mean_body_acc_jerk_y**: gravity units/second
11. **mean_body_acc_jerk_z**: gravity units/second
12. **mean_body_orient_x**: radians/second
13. **mean_body_orient_y**: radians/second
14. **mean_body_orient_z**: radians/second
15. **mean_body_orient_jerk_x**: radians/second^2
16. **mean_body_orient_jerk_y**: radians/second^2
17. **mean_body_orient_jerk_z**: radians/second^2
18. **mean_body_acc**: standard gravity units 'g'
19. **mean_gravity_acc**: standard gravity units 'g'
20. **mean_body_acc_jerk**: gravity units/second
21. **mean_body_orient**: radians/second
22. **mean_body_orient_jerk**: radians/second^2
23. **f_mean_body_acc_x**: gravity units/second 
24. **f_mean_body_acc_y**: gravity units/second
25. **f_mean_body_acc_z**: gravity units/second
26. **f_mean_body_acc_jerk_x**: gravity units/second^2
27. **f_mean_body_acc_jerk_y**: gravity units/second^2
28. **f_mean_body_acc_jerk_z**: gravity units/second^2
29. **f_mean_body_orient_x**: radians/second^2
30. **f_mean_body_orient_y**: radians/second^2
31. **f_mean_body_orient_z**: radians/second^2
32. **f_mean_body_acc**: gravity units/second
33. **f_mean_body_acc_jerk**: gravity units/second^2
34. **f_mean_body_orient**: radians/second^2
35. **f_mean_body_orient_jerk**: radians/second^3
36. **sd_body_acc_x**: gravity units
37. **sd_body_acc_y**: gravity units
38. **sd_body_acc_z**: gravity units
39. **sd_gravity_acc_x**: gravity units
40. **sd_gravity_acc_y**: gravity units
41. **sd_gravity_acc_z**: gravity units
42. **sd_body_acc_jerk_x**: gravity units/second
43. **sd_body_acc_jerk_y**: gravity units/second
44. **sd_body_acc_jerk_z**: gravity units/second
45. **sd_body_orient_x**: radians/second
46. **sd_body_orient_y**: radians/second
47. **sd_body_orient_z**: radians/second
48. **sd_body_orient_jerk_x**: radians/second^2
49. **sd_body_orient_jerk_y**: radians/second^2
50. **sd_body_orient_jerk_z**: radians/second^2
51. **sd_body_acc**: gravity units
52. **sd_gravity_acc**: gravity units
53. **sd_body_acc_jerk**: gravity units/second
54. **sd_body_orient**: radians/second
55. **sd_body_orient_jerk**: radians/second^2
56. **f_sd_body_acc_x**: gravity units/second
57. **f_sd_body_acc_y**: gravity units/second
58. **f_sd_body_acc_z**: gravity units/second
59. **f_sd_body_acc_jerk_x**: gravity units/second^2
60. **f_sd_body_acc_jerk_y**: gravity units/second^2
61. **f_sd_body_acc_jerk_z**: gravity units/second^2
62. **f_sd_body_orient_x**: radians/second^2
63. **f_sd_body_orient_y**: radians/second^2
64. **f_sd_body_orient_z**: radians/second^2
65. **f_sd_body_acc**: gravity units/second
66. **f_sd_body_acc_jerk**: gravity units/second^2
67. **f_sd_body_orient**: radians/second^2
68. **f_sd_body_orient_jerk**: radians/second^3

## Experimental Design
The Human Activity Recognition Using Smartphones Dataset was downloaded and read into R. 