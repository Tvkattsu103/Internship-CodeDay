package Bean;

public class DashboardBean {
	public int Year ;
	
	public int January ;
	
	public int February ;

    public int March ;

    public int April ;

    public int May ;

    public int June ;

    public int July ;

    public int August ;

    public int September ;

    public int October ;

    public int November ;

    public int getYear() {
		return Year;
	}

	public void setYear(int year) {
		Year = year;
	}

	public int getJanuary() {
		return January;
	}

	public void setJanuary(int january) {
		January = january;
	}

	public int getFebruary() {
		return February;
	}

	public void setFebruary(int february) {
		February = february;
	}

	public int getMarch() {
		return March;
	}

	public void setMarch(int march) {
		March = march;
	}

	public int getApril() {
		return April;
	}

	public void setApril(int april) {
		April = april;
	}

	public int getMay() {
		return May;
	}

	public void setMay(int may) {
		May = may;
	}

	public int getJune() {
		return June;
	}

	public void setJune(int june) {
		June = june;
	}

	public int getJuly() {
		return July;
	}

	public void setJuly(int july) {
		July = july;
	}

	public int getAugust() {
		return August;
	}

	public void setAugust(int august) {
		August = august;
	}

	public int getSeptember() {
		return September;
	}

	public void setSeptember(int september) {
		September = september;
	}

	public int getOctober() {
		return October;
	}

	public void setOctober(int october) {
		October = october;
	}

	public int getNovember() {
		return November;
	}

	public void setNovember(int november) {
		November = november;
	}

	public int getDecember() {
		return December;
	}

	public void setDecember(int december) {
		December = december;
	}

	public int December ;
    
    public int ToTal()
    {
        return January + February + March + April + May + June + July + August + September + December + October + November;
    }
}
