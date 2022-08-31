package com.PSVM.dopamin.service.Item;

import com.PSVM.dopamin.domain.Item.Pymt_DetlDto;
import junit.framework.TestCase;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ItemAdminServiceTest extends TestCase {
    @Autowired
    private ItemAdminService itemAdminService;
    @Test
    public void testPymt_detl() {
        Pymt_DetlDto pymt_detlDto = new Pymt_DetlDto();
        pymt_detlDto.setPymt_amt(5000);
        pymt_detlDto.setChg_pnt(8000);
        pymt_detlDto.setUser_id("ldhoon0813");
        pymt_detlDto.setPg_corp_detl_id("2c7785a334e1fbab53a2");
        try {
            boolean result=itemAdminService.pymt_detl(pymt_detlDto);
            System.out.println("result = " + result);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}