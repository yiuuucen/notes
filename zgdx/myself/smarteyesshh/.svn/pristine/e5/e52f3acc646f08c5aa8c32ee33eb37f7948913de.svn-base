package cn.com.ctbri.ctbigdata.smarteyes.model;

public class ContactSummary extends ContactSummaryKey {
    private Integer durationLength;

    private Integer msgCounter;

    private Integer workCallCounter;

    private Integer restCallCounter;

    private Integer underFifteenSecondsCounter;

    private Integer aboveThreeMinCounter;

    private String topLocation;

    public ContactSummary() {
        this.durationLength = 0;
        this.msgCounter = 0;
        this.aboveThreeMinCounter = 0;
        this.underFifteenSecondsCounter = 0;
        this.workCallCounter = 0;
        this.restCallCounter = 0;
    }

    public Integer getDurationLength() {
        return durationLength;
    }

    public void setDurationLength(Integer durationLength) {
        this.durationLength = durationLength;
    }

    public Integer getMsgCounter() {
        return msgCounter;
    }

    public void setMsgCounter(Integer msgCounter) {
        this.msgCounter = msgCounter;
    }

    public Integer getWorkCallCounter() {
        return workCallCounter;
    }

    public void setWorkCallCounter(Integer workCallCounter) {
        this.workCallCounter = workCallCounter;
    }

    public Integer getRestCallCounter() {
        return restCallCounter;
    }

    public void setRestCallCounter(Integer restCallCounter) {
        this.restCallCounter = restCallCounter;
    }

    public Integer getUnderFifteenSecondsCounter() {
        return underFifteenSecondsCounter;
    }

    public void setUnderFifteenSecondsCounter(Integer underFifteenSecondsCounter) {
        this.underFifteenSecondsCounter = underFifteenSecondsCounter;
    }

    public Integer getAboveThreeMinCounter() {
        return aboveThreeMinCounter;
    }

    public void setAboveThreeMinCounter(Integer aboveThreeMinCounter) {
        this.aboveThreeMinCounter = aboveThreeMinCounter;
    }

    public String getTopLocation() {
        return topLocation;
    }

    public void setTopLocation(String topLocation) {
        this.topLocation = topLocation == null ? null : topLocation.trim();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof ContactSummary)) return false;

        ContactSummary that = (ContactSummary) o;

        if (durationLength != null ? !durationLength.equals(that.durationLength) : that.durationLength != null)
            return false;
        if (msgCounter != null ? !msgCounter.equals(that.msgCounter) : that.msgCounter != null) return false;
        if (workCallCounter != null ? !workCallCounter.equals(that.workCallCounter) : that.workCallCounter != null)
            return false;
        if (restCallCounter != null ? !restCallCounter.equals(that.restCallCounter) : that.restCallCounter != null)
            return false;
        if (underFifteenSecondsCounter != null ? !underFifteenSecondsCounter.equals(that.underFifteenSecondsCounter) : that.underFifteenSecondsCounter != null)
            return false;
        if (aboveThreeMinCounter != null ? !aboveThreeMinCounter.equals(that.aboveThreeMinCounter) : that.aboveThreeMinCounter != null)
            return false;
        return topLocation != null ? topLocation.equals(that.topLocation) : that.topLocation == null;

    }

    @Override
    public int hashCode() {
        int result = durationLength != null ? durationLength.hashCode() : 0;
        result = 31 * result + (msgCounter != null ? msgCounter.hashCode() : 0);
        result = 31 * result + (workCallCounter != null ? workCallCounter.hashCode() : 0);
        result = 31 * result + (restCallCounter != null ? restCallCounter.hashCode() : 0);
        result = 31 * result + (underFifteenSecondsCounter != null ? underFifteenSecondsCounter.hashCode() : 0);
        result = 31 * result + (aboveThreeMinCounter != null ? aboveThreeMinCounter.hashCode() : 0);
        result = 31 * result + (topLocation != null ? topLocation.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "ContactSummary{" +
                "durationLength=" + durationLength +
                ", msgCounter=" + msgCounter +
                ", workCallCounter=" + workCallCounter +
                ", restCallCounter=" + restCallCounter +
                ", underFifteenSecondsCounter=" + underFifteenSecondsCounter +
                ", aboveThreeMinCounter=" + aboveThreeMinCounter +
                ", topLocation='" + topLocation + '\'' +
                '}';
    }
}