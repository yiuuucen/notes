package cn.com.ctbri.ctbigdata.smarteyes.model;

import java.util.ArrayList;
import java.util.List;

public class ContactSummaryExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ContactSummaryExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andCallingIsNull() {
            addCriterion("calling is null");
            return (Criteria) this;
        }

        public Criteria andCallingIsNotNull() {
            addCriterion("calling is not null");
            return (Criteria) this;
        }

        public Criteria andCallingEqualTo(String value) {
            addCriterion("calling =", value, "calling");
            return (Criteria) this;
        }

        public Criteria andCallingNotEqualTo(String value) {
            addCriterion("calling <>", value, "calling");
            return (Criteria) this;
        }

        public Criteria andCallingGreaterThan(String value) {
            addCriterion("calling >", value, "calling");
            return (Criteria) this;
        }

        public Criteria andCallingGreaterThanOrEqualTo(String value) {
            addCriterion("calling >=", value, "calling");
            return (Criteria) this;
        }

        public Criteria andCallingLessThan(String value) {
            addCriterion("calling <", value, "calling");
            return (Criteria) this;
        }

        public Criteria andCallingLessThanOrEqualTo(String value) {
            addCriterion("calling <=", value, "calling");
            return (Criteria) this;
        }

        public Criteria andCallingLike(String value) {
            addCriterion("calling like", value, "calling");
            return (Criteria) this;
        }

        public Criteria andCallingNotLike(String value) {
            addCriterion("calling not like", value, "calling");
            return (Criteria) this;
        }

        public Criteria andCallingIn(List<String> values) {
            addCriterion("calling in", values, "calling");
            return (Criteria) this;
        }

        public Criteria andCallingNotIn(List<String> values) {
            addCriterion("calling not in", values, "calling");
            return (Criteria) this;
        }

        public Criteria andCallingBetween(String value1, String value2) {
            addCriterion("calling between", value1, value2, "calling");
            return (Criteria) this;
        }

        public Criteria andCallingNotBetween(String value1, String value2) {
            addCriterion("calling not between", value1, value2, "calling");
            return (Criteria) this;
        }

        public Criteria andCalledIsNull() {
            addCriterion("called is null");
            return (Criteria) this;
        }

        public Criteria andCalledIsNotNull() {
            addCriterion("called is not null");
            return (Criteria) this;
        }

        public Criteria andCalledEqualTo(String value) {
            addCriterion("called =", value, "called");
            return (Criteria) this;
        }

        public Criteria andCalledNotEqualTo(String value) {
            addCriterion("called <>", value, "called");
            return (Criteria) this;
        }

        public Criteria andCalledGreaterThan(String value) {
            addCriterion("called >", value, "called");
            return (Criteria) this;
        }

        public Criteria andCalledGreaterThanOrEqualTo(String value) {
            addCriterion("called >=", value, "called");
            return (Criteria) this;
        }

        public Criteria andCalledLessThan(String value) {
            addCriterion("called <", value, "called");
            return (Criteria) this;
        }

        public Criteria andCalledLessThanOrEqualTo(String value) {
            addCriterion("called <=", value, "called");
            return (Criteria) this;
        }

        public Criteria andCalledLike(String value) {
            addCriterion("called like", value, "called");
            return (Criteria) this;
        }

        public Criteria andCalledNotLike(String value) {
            addCriterion("called not like", value, "called");
            return (Criteria) this;
        }

        public Criteria andCalledIn(List<String> values) {
            addCriterion("called in", values, "called");
            return (Criteria) this;
        }

        public Criteria andCalledNotIn(List<String> values) {
            addCriterion("called not in", values, "called");
            return (Criteria) this;
        }

        public Criteria andCalledBetween(String value1, String value2) {
            addCriterion("called between", value1, value2, "called");
            return (Criteria) this;
        }

        public Criteria andCalledNotBetween(String value1, String value2) {
            addCriterion("called not between", value1, value2, "called");
            return (Criteria) this;
        }

        public Criteria andDurationLengthIsNull() {
            addCriterion("duration_length is null");
            return (Criteria) this;
        }

        public Criteria andDurationLengthIsNotNull() {
            addCriterion("duration_length is not null");
            return (Criteria) this;
        }

        public Criteria andDurationLengthEqualTo(Integer value) {
            addCriterion("duration_length =", value, "durationLength");
            return (Criteria) this;
        }

        public Criteria andDurationLengthNotEqualTo(Integer value) {
            addCriterion("duration_length <>", value, "durationLength");
            return (Criteria) this;
        }

        public Criteria andDurationLengthGreaterThan(Integer value) {
            addCriterion("duration_length >", value, "durationLength");
            return (Criteria) this;
        }

        public Criteria andDurationLengthGreaterThanOrEqualTo(Integer value) {
            addCriterion("duration_length >=", value, "durationLength");
            return (Criteria) this;
        }

        public Criteria andDurationLengthLessThan(Integer value) {
            addCriterion("duration_length <", value, "durationLength");
            return (Criteria) this;
        }

        public Criteria andDurationLengthLessThanOrEqualTo(Integer value) {
            addCriterion("duration_length <=", value, "durationLength");
            return (Criteria) this;
        }

        public Criteria andDurationLengthIn(List<Integer> values) {
            addCriterion("duration_length in", values, "durationLength");
            return (Criteria) this;
        }

        public Criteria andDurationLengthNotIn(List<Integer> values) {
            addCriterion("duration_length not in", values, "durationLength");
            return (Criteria) this;
        }

        public Criteria andDurationLengthBetween(Integer value1, Integer value2) {
            addCriterion("duration_length between", value1, value2, "durationLength");
            return (Criteria) this;
        }

        public Criteria andDurationLengthNotBetween(Integer value1, Integer value2) {
            addCriterion("duration_length not between", value1, value2, "durationLength");
            return (Criteria) this;
        }

        public Criteria andMsgCounterIsNull() {
            addCriterion("msg_counter is null");
            return (Criteria) this;
        }

        public Criteria andMsgCounterIsNotNull() {
            addCriterion("msg_counter is not null");
            return (Criteria) this;
        }

        public Criteria andMsgCounterEqualTo(Integer value) {
            addCriterion("msg_counter =", value, "msgCounter");
            return (Criteria) this;
        }

        public Criteria andMsgCounterNotEqualTo(Integer value) {
            addCriterion("msg_counter <>", value, "msgCounter");
            return (Criteria) this;
        }

        public Criteria andMsgCounterGreaterThan(Integer value) {
            addCriterion("msg_counter >", value, "msgCounter");
            return (Criteria) this;
        }

        public Criteria andMsgCounterGreaterThanOrEqualTo(Integer value) {
            addCriterion("msg_counter >=", value, "msgCounter");
            return (Criteria) this;
        }

        public Criteria andMsgCounterLessThan(Integer value) {
            addCriterion("msg_counter <", value, "msgCounter");
            return (Criteria) this;
        }

        public Criteria andMsgCounterLessThanOrEqualTo(Integer value) {
            addCriterion("msg_counter <=", value, "msgCounter");
            return (Criteria) this;
        }

        public Criteria andMsgCounterIn(List<Integer> values) {
            addCriterion("msg_counter in", values, "msgCounter");
            return (Criteria) this;
        }

        public Criteria andMsgCounterNotIn(List<Integer> values) {
            addCriterion("msg_counter not in", values, "msgCounter");
            return (Criteria) this;
        }

        public Criteria andMsgCounterBetween(Integer value1, Integer value2) {
            addCriterion("msg_counter between", value1, value2, "msgCounter");
            return (Criteria) this;
        }

        public Criteria andMsgCounterNotBetween(Integer value1, Integer value2) {
            addCriterion("msg_counter not between", value1, value2, "msgCounter");
            return (Criteria) this;
        }

        public Criteria andWorkCallCounterIsNull() {
            addCriterion("work_call_counter is null");
            return (Criteria) this;
        }

        public Criteria andWorkCallCounterIsNotNull() {
            addCriterion("work_call_counter is not null");
            return (Criteria) this;
        }

        public Criteria andWorkCallCounterEqualTo(Integer value) {
            addCriterion("work_call_counter =", value, "workCallCounter");
            return (Criteria) this;
        }

        public Criteria andWorkCallCounterNotEqualTo(Integer value) {
            addCriterion("work_call_counter <>", value, "workCallCounter");
            return (Criteria) this;
        }

        public Criteria andWorkCallCounterGreaterThan(Integer value) {
            addCriterion("work_call_counter >", value, "workCallCounter");
            return (Criteria) this;
        }

        public Criteria andWorkCallCounterGreaterThanOrEqualTo(Integer value) {
            addCriterion("work_call_counter >=", value, "workCallCounter");
            return (Criteria) this;
        }

        public Criteria andWorkCallCounterLessThan(Integer value) {
            addCriterion("work_call_counter <", value, "workCallCounter");
            return (Criteria) this;
        }

        public Criteria andWorkCallCounterLessThanOrEqualTo(Integer value) {
            addCriterion("work_call_counter <=", value, "workCallCounter");
            return (Criteria) this;
        }

        public Criteria andWorkCallCounterIn(List<Integer> values) {
            addCriterion("work_call_counter in", values, "workCallCounter");
            return (Criteria) this;
        }

        public Criteria andWorkCallCounterNotIn(List<Integer> values) {
            addCriterion("work_call_counter not in", values, "workCallCounter");
            return (Criteria) this;
        }

        public Criteria andWorkCallCounterBetween(Integer value1, Integer value2) {
            addCriterion("work_call_counter between", value1, value2, "workCallCounter");
            return (Criteria) this;
        }

        public Criteria andWorkCallCounterNotBetween(Integer value1, Integer value2) {
            addCriterion("work_call_counter not between", value1, value2, "workCallCounter");
            return (Criteria) this;
        }

        public Criteria andRestCallCounterIsNull() {
            addCriterion("rest_call_counter is null");
            return (Criteria) this;
        }

        public Criteria andRestCallCounterIsNotNull() {
            addCriterion("rest_call_counter is not null");
            return (Criteria) this;
        }

        public Criteria andRestCallCounterEqualTo(Integer value) {
            addCriterion("rest_call_counter =", value, "restCallCounter");
            return (Criteria) this;
        }

        public Criteria andRestCallCounterNotEqualTo(Integer value) {
            addCriterion("rest_call_counter <>", value, "restCallCounter");
            return (Criteria) this;
        }

        public Criteria andRestCallCounterGreaterThan(Integer value) {
            addCriterion("rest_call_counter >", value, "restCallCounter");
            return (Criteria) this;
        }

        public Criteria andRestCallCounterGreaterThanOrEqualTo(Integer value) {
            addCriterion("rest_call_counter >=", value, "restCallCounter");
            return (Criteria) this;
        }

        public Criteria andRestCallCounterLessThan(Integer value) {
            addCriterion("rest_call_counter <", value, "restCallCounter");
            return (Criteria) this;
        }

        public Criteria andRestCallCounterLessThanOrEqualTo(Integer value) {
            addCriterion("rest_call_counter <=", value, "restCallCounter");
            return (Criteria) this;
        }

        public Criteria andRestCallCounterIn(List<Integer> values) {
            addCriterion("rest_call_counter in", values, "restCallCounter");
            return (Criteria) this;
        }

        public Criteria andRestCallCounterNotIn(List<Integer> values) {
            addCriterion("rest_call_counter not in", values, "restCallCounter");
            return (Criteria) this;
        }

        public Criteria andRestCallCounterBetween(Integer value1, Integer value2) {
            addCriterion("rest_call_counter between", value1, value2, "restCallCounter");
            return (Criteria) this;
        }

        public Criteria andRestCallCounterNotBetween(Integer value1, Integer value2) {
            addCriterion("rest_call_counter not between", value1, value2, "restCallCounter");
            return (Criteria) this;
        }

        public Criteria andUnderFifteenSecondsCounterIsNull() {
            addCriterion("under_fifteen_seconds_counter is null");
            return (Criteria) this;
        }

        public Criteria andUnderFifteenSecondsCounterIsNotNull() {
            addCriterion("under_fifteen_seconds_counter is not null");
            return (Criteria) this;
        }

        public Criteria andUnderFifteenSecondsCounterEqualTo(Integer value) {
            addCriterion("under_fifteen_seconds_counter =", value, "underFifteenSecondsCounter");
            return (Criteria) this;
        }

        public Criteria andUnderFifteenSecondsCounterNotEqualTo(Integer value) {
            addCriterion("under_fifteen_seconds_counter <>", value, "underFifteenSecondsCounter");
            return (Criteria) this;
        }

        public Criteria andUnderFifteenSecondsCounterGreaterThan(Integer value) {
            addCriterion("under_fifteen_seconds_counter >", value, "underFifteenSecondsCounter");
            return (Criteria) this;
        }

        public Criteria andUnderFifteenSecondsCounterGreaterThanOrEqualTo(Integer value) {
            addCriterion("under_fifteen_seconds_counter >=", value, "underFifteenSecondsCounter");
            return (Criteria) this;
        }

        public Criteria andUnderFifteenSecondsCounterLessThan(Integer value) {
            addCriterion("under_fifteen_seconds_counter <", value, "underFifteenSecondsCounter");
            return (Criteria) this;
        }

        public Criteria andUnderFifteenSecondsCounterLessThanOrEqualTo(Integer value) {
            addCriterion("under_fifteen_seconds_counter <=", value, "underFifteenSecondsCounter");
            return (Criteria) this;
        }

        public Criteria andUnderFifteenSecondsCounterIn(List<Integer> values) {
            addCriterion("under_fifteen_seconds_counter in", values, "underFifteenSecondsCounter");
            return (Criteria) this;
        }

        public Criteria andUnderFifteenSecondsCounterNotIn(List<Integer> values) {
            addCriterion("under_fifteen_seconds_counter not in", values, "underFifteenSecondsCounter");
            return (Criteria) this;
        }

        public Criteria andUnderFifteenSecondsCounterBetween(Integer value1, Integer value2) {
            addCriterion("under_fifteen_seconds_counter between", value1, value2, "underFifteenSecondsCounter");
            return (Criteria) this;
        }

        public Criteria andUnderFifteenSecondsCounterNotBetween(Integer value1, Integer value2) {
            addCriterion("under_fifteen_seconds_counter not between", value1, value2, "underFifteenSecondsCounter");
            return (Criteria) this;
        }

        public Criteria andAboveThreeMinCounterIsNull() {
            addCriterion("above_three_min_counter is null");
            return (Criteria) this;
        }

        public Criteria andAboveThreeMinCounterIsNotNull() {
            addCriterion("above_three_min_counter is not null");
            return (Criteria) this;
        }

        public Criteria andAboveThreeMinCounterEqualTo(Integer value) {
            addCriterion("above_three_min_counter =", value, "aboveThreeMinCounter");
            return (Criteria) this;
        }

        public Criteria andAboveThreeMinCounterNotEqualTo(Integer value) {
            addCriterion("above_three_min_counter <>", value, "aboveThreeMinCounter");
            return (Criteria) this;
        }

        public Criteria andAboveThreeMinCounterGreaterThan(Integer value) {
            addCriterion("above_three_min_counter >", value, "aboveThreeMinCounter");
            return (Criteria) this;
        }

        public Criteria andAboveThreeMinCounterGreaterThanOrEqualTo(Integer value) {
            addCriterion("above_three_min_counter >=", value, "aboveThreeMinCounter");
            return (Criteria) this;
        }

        public Criteria andAboveThreeMinCounterLessThan(Integer value) {
            addCriterion("above_three_min_counter <", value, "aboveThreeMinCounter");
            return (Criteria) this;
        }

        public Criteria andAboveThreeMinCounterLessThanOrEqualTo(Integer value) {
            addCriterion("above_three_min_counter <=", value, "aboveThreeMinCounter");
            return (Criteria) this;
        }

        public Criteria andAboveThreeMinCounterIn(List<Integer> values) {
            addCriterion("above_three_min_counter in", values, "aboveThreeMinCounter");
            return (Criteria) this;
        }

        public Criteria andAboveThreeMinCounterNotIn(List<Integer> values) {
            addCriterion("above_three_min_counter not in", values, "aboveThreeMinCounter");
            return (Criteria) this;
        }

        public Criteria andAboveThreeMinCounterBetween(Integer value1, Integer value2) {
            addCriterion("above_three_min_counter between", value1, value2, "aboveThreeMinCounter");
            return (Criteria) this;
        }

        public Criteria andAboveThreeMinCounterNotBetween(Integer value1, Integer value2) {
            addCriterion("above_three_min_counter not between", value1, value2, "aboveThreeMinCounter");
            return (Criteria) this;
        }

        public Criteria andTopLocationIsNull() {
            addCriterion("top_location is null");
            return (Criteria) this;
        }

        public Criteria andTopLocationIsNotNull() {
            addCriterion("top_location is not null");
            return (Criteria) this;
        }

        public Criteria andTopLocationEqualTo(String value) {
            addCriterion("top_location =", value, "topLocation");
            return (Criteria) this;
        }

        public Criteria andTopLocationNotEqualTo(String value) {
            addCriterion("top_location <>", value, "topLocation");
            return (Criteria) this;
        }

        public Criteria andTopLocationGreaterThan(String value) {
            addCriterion("top_location >", value, "topLocation");
            return (Criteria) this;
        }

        public Criteria andTopLocationGreaterThanOrEqualTo(String value) {
            addCriterion("top_location >=", value, "topLocation");
            return (Criteria) this;
        }

        public Criteria andTopLocationLessThan(String value) {
            addCriterion("top_location <", value, "topLocation");
            return (Criteria) this;
        }

        public Criteria andTopLocationLessThanOrEqualTo(String value) {
            addCriterion("top_location <=", value, "topLocation");
            return (Criteria) this;
        }

        public Criteria andTopLocationLike(String value) {
            addCriterion("top_location like", value, "topLocation");
            return (Criteria) this;
        }

        public Criteria andTopLocationNotLike(String value) {
            addCriterion("top_location not like", value, "topLocation");
            return (Criteria) this;
        }

        public Criteria andTopLocationIn(List<String> values) {
            addCriterion("top_location in", values, "topLocation");
            return (Criteria) this;
        }

        public Criteria andTopLocationNotIn(List<String> values) {
            addCriterion("top_location not in", values, "topLocation");
            return (Criteria) this;
        }

        public Criteria andTopLocationBetween(String value1, String value2) {
            addCriterion("top_location between", value1, value2, "topLocation");
            return (Criteria) this;
        }

        public Criteria andTopLocationNotBetween(String value1, String value2) {
            addCriterion("top_location not between", value1, value2, "topLocation");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}