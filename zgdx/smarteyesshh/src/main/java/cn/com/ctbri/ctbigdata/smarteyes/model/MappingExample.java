package cn.com.ctbri.ctbigdata.smarteyes.model;

import java.util.ArrayList;
import java.util.List;

public class MappingExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public MappingExample() {
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

        public Criteria andMdnIsNull() {
            addCriterion("mdn is null");
            return (Criteria) this;
        }

        public Criteria andMdnIsNotNull() {
            addCriterion("mdn is not null");
            return (Criteria) this;
        }

        public Criteria andMdnEqualTo(String value) {
            addCriterion("mdn =", value, "mdn");
            return (Criteria) this;
        }

        public Criteria andMdnNotEqualTo(String value) {
            addCriterion("mdn <>", value, "mdn");
            return (Criteria) this;
        }

        public Criteria andMdnGreaterThan(String value) {
            addCriterion("mdn >", value, "mdn");
            return (Criteria) this;
        }

        public Criteria andMdnGreaterThanOrEqualTo(String value) {
            addCriterion("mdn >=", value, "mdn");
            return (Criteria) this;
        }

        public Criteria andMdnLessThan(String value) {
            addCriterion("mdn <", value, "mdn");
            return (Criteria) this;
        }

        public Criteria andMdnLessThanOrEqualTo(String value) {
            addCriterion("mdn <=", value, "mdn");
            return (Criteria) this;
        }

        public Criteria andMdnLike(String value) {
            addCriterion("mdn like", value, "mdn");
            return (Criteria) this;
        }

        public Criteria andMdnNotLike(String value) {
            addCriterion("mdn not like", value, "mdn");
            return (Criteria) this;
        }

        public Criteria andMdnIn(List<String> values) {
            addCriterion("mdn in", values, "mdn");
            return (Criteria) this;
        }

        public Criteria andMdnNotIn(List<String> values) {
            addCriterion("mdn not in", values, "mdn");
            return (Criteria) this;
        }

        public Criteria andMdnBetween(String value1, String value2) {
            addCriterion("mdn between", value1, value2, "mdn");
            return (Criteria) this;
        }

        public Criteria andMdnNotBetween(String value1, String value2) {
            addCriterion("mdn not between", value1, value2, "mdn");
            return (Criteria) this;
        }

        public Criteria andTelecomEncryptIsNull() {
            addCriterion("telecom_encrypt is null");
            return (Criteria) this;
        }

        public Criteria andTelecomEncryptIsNotNull() {
            addCriterion("telecom_encrypt is not null");
            return (Criteria) this;
        }

        public Criteria andTelecomEncryptEqualTo(String value) {
            addCriterion("telecom_encrypt =", value, "telecomEncrypt");
            return (Criteria) this;
        }

        public Criteria andTelecomEncryptNotEqualTo(String value) {
            addCriterion("telecom_encrypt <>", value, "telecomEncrypt");
            return (Criteria) this;
        }

        public Criteria andTelecomEncryptGreaterThan(String value) {
            addCriterion("telecom_encrypt >", value, "telecomEncrypt");
            return (Criteria) this;
        }

        public Criteria andTelecomEncryptGreaterThanOrEqualTo(String value) {
            addCriterion("telecom_encrypt >=", value, "telecomEncrypt");
            return (Criteria) this;
        }

        public Criteria andTelecomEncryptLessThan(String value) {
            addCriterion("telecom_encrypt <", value, "telecomEncrypt");
            return (Criteria) this;
        }

        public Criteria andTelecomEncryptLessThanOrEqualTo(String value) {
            addCriterion("telecom_encrypt <=", value, "telecomEncrypt");
            return (Criteria) this;
        }

        public Criteria andTelecomEncryptLike(String value) {
            addCriterion("telecom_encrypt like", value, "telecomEncrypt");
            return (Criteria) this;
        }

        public Criteria andTelecomEncryptNotLike(String value) {
            addCriterion("telecom_encrypt not like", value, "telecomEncrypt");
            return (Criteria) this;
        }

        public Criteria andTelecomEncryptIn(List<String> values) {
            addCriterion("telecom_encrypt in", values, "telecomEncrypt");
            return (Criteria) this;
        }

        public Criteria andTelecomEncryptNotIn(List<String> values) {
            addCriterion("telecom_encrypt not in", values, "telecomEncrypt");
            return (Criteria) this;
        }

        public Criteria andTelecomEncryptBetween(String value1, String value2) {
            addCriterion("telecom_encrypt between", value1, value2, "telecomEncrypt");
            return (Criteria) this;
        }

        public Criteria andTelecomEncryptNotBetween(String value1, String value2) {
            addCriterion("telecom_encrypt not between", value1, value2, "telecomEncrypt");
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