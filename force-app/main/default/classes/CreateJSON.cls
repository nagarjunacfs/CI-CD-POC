public class CreateJSON {
	public class OrderCreate {
        public List<Partner> partner;
        public Header header;
        public List<Items> items;
    }

    public String salesOrg;
    public List<OrderCreate> orderCreate;

    public class Header {
        public String documentType;
        public String requestedDeliveryDate;
        public String customerPoDate;
        public String yourReference;
        public String poType;
        public String customerPoNumber;
        public String documentDate;
    }

    public class Items {
        public String number1;
        public String material;
        public Integer targetQuantity;
        public String targetQuantityUom;
        public String usage;
    }

    public class Partner {
        public String number1;
    }
}