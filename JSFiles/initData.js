
/* initial the Year and Month data ¤é´Á*/
function initYear(yearName, monthName, showYearValue, showMonthValue)
{
	var strSelect = 0;
	for (i = 0,  j = 1900; i < 100, j < 2003; i++, j++)
	{
		yearName.options[i] = new Option(j, j);
		if (j == showYearValue)
			strSelect = i;
	}
	yearName.selectedIndex = strSelect ;
	strSelect = 0;

	for (i = 0, j = 1; i < 12, j < 13; i++, j++)
	{
		monthName.options[i] = new Option(j, j);
		if (j == showMonthValue)
			strSelect = i;
	}
	monthName.selectedIndex = strSelect ;
}

function leapYear(year) {
	if (((year % 4 == 0)&&(year % 100 != 0)) || (year % 400 == 0)) // basic rule
		return true // is leap year
	/* else */ // else not needed when statement is "return"
		return false // is not leap year
}

function getDays(month, year) {
	// create array to hold number of days in each month
	var ar = new Array(12)
	ar[0] = 31 // January
	ar[1] = (leapYear(year)) ? 29 : 28 // February
	ar[2] = 31 // March
	ar[3] = 30 // April
	ar[4] = 31 // May
	ar[5] = 30 // June
	ar[6] = 31 // July
	ar[7] = 31 // August
	ar[8] = 30 // September
	ar[9] = 31 // October
	ar[10] = 30 // November
	ar[11] = 31 // December

	// return number of days in the specified month (parameter)
	return ar[month]
}

function chkday(YearName,MonthName,DayName,ShowDate) //check the days for the selected month
{
	var HaveDay ;
	var now = new Date();
	HaveDay = getDays(MonthName.value-1,YearName.value);
	showday(HaveDay,DayName,ShowDate);
}

function showday(HaveDay,DayName,ShowDate) //show the days
{
	var now = new Date();
	DayName.options.length = 0;
	for ( j = 0; j < HaveDay; j++ )
	{
		DayName.options[j] = new Option(j+1,j+1);
	}

	if (ShowDate == "") {
		DayName.selectedIndex = now.getDate() - 1;
	}
	else {
		DayName.selectedIndex = ShowDate - 1;
	}
}

