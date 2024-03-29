package com.model2.mvc.service.purchase.impl;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.purchase.PurchaseDao;
import com.model2.mvc.service.purchase.PurchaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.Map;
@Service("purchaseServiceImpl")
public class PurchaseServiceImpl implements PurchaseService {
    //// Fields
    private PurchaseDao purchaseDao;
    /// Setters
    @Autowired
    public void setPurchaseDao(@Qualifier("purchaseDaoImpl") PurchaseDao purchaseDao) {
        this.purchaseDao = purchaseDao;
    }
    // Constructors
    public PurchaseServiceImpl() {
    }
    // Methods
    public void addPurchase(Purchase purchase) throws Exception {
        purchaseDao.addPurchase(purchase);

    }
    public Purchase getPurchase(int tranNo) throws Exception {
        return purchaseDao.getPurchase(tranNo);
    }
    public Map<String, Object> getPurchaseList(Map<String,Object> map) throws Exception {
        return purchaseDao.getPurchaseList(map);
    }
    public Map<String, Object> getSaleList(Search search) throws Exception {
        return purchaseDao.getSaleList(search);
    }
    public Purchase updatePurchase(Purchase purchase) throws Exception {
        return purchaseDao.updatePurchase(purchase);
    }
    public void updateTranCode(Purchase purchase) throws Exception {
        purchaseDao.updateTranCode(purchase);
    }

}
