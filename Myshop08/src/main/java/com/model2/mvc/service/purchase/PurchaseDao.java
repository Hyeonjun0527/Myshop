package com.model2.mvc.service.purchase;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;

import java.util.Map;

public interface PurchaseDao {

        public void addPurchase(Purchase purchase) throws Exception;

        public Purchase getPurchase(int tranNo) throws Exception;

        public Map<String, Object> getPurchaseList(Map<String, Object> map) throws Exception;

        public Map<String, Object> getSaleList(Search search) throws Exception;

        public Purchase updatePurchase(Purchase purchase) throws Exception;

        public void updateTranCode(Purchase purchase) throws Exception;



}
