package com.PSVM.dopamin.service;

import com.PSVM.dopamin.domain.ItemDto;
import com.PSVM.dopamin.dao.ItemDaoImpl;
import com.PSVM.dopamin.domain.ItemForm;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
public class ItemService {
    private final ItemDaoImpl itemDaoImpl;
    public ItemService(ItemDaoImpl itemDaoImpl) {
        this.itemDaoImpl = itemDaoImpl;
    }
    public int getCount() throws Exception{
        return itemDaoImpl.getCount();
    }

    public List<ItemDto> getPage(String order) throws Exception{
        int index;
        if(order.equals("스킨")){
            index=1;
        }
        else{
            index=2;
        }
        return itemDaoImpl.getPage(index);
    }
    public List<ItemDto> getStat_0() throws Exception {
        return itemDaoImpl.getStat_0();
    }
    public List<ItemDto> getStat_1() throws Exception {
        return itemDaoImpl.getStat_1();
    }
    public int registerItem(ItemForm itemForm, MultipartFile multipartFile, Map map) throws Exception{
        //Controller에서 이미 검증된 정보들이 service로 넘어왔다.
        //여기서는 itemForm들의 정보를 item table처럼 가공해야하고,
        //file의 저장 경로도 설정해줘야 한다.
        //전제: 이미지 무조건 있다 -> Controller에서 검사하고 들어왔으니
        System.out.println(multipartFile.getOriginalFilename());
        String save_url=save_File(multipartFile);//파일 저장 //이미지 경로 반환
        map.put("save_url",save_url);
        sprint(itemForm);
        System.out.println(map.get("save_url"));
        ItemDto itemDto=save_into_ItemDto(itemForm,map);
        System.out.println(itemDto);
        int result= itemDaoImpl.registerItem(itemDto);
        return result;
    }
    private ItemDto save_into_ItemDto(ItemForm itemForm,Map map) {
        ItemDto itemDto = new ItemDto();
        if(itemForm.getList_nm().equals("스킨")){
            itemDto.setList_id(1);
        }
        else{
            itemDto.setList_id(2);
        }
        itemDto.setGrd_nm(itemForm.getItem_grd());
        itemDto.setItem_nm(itemForm.getItem_nm());
        itemDto.setItem_dsc(itemForm.getItem_dsc());
        itemDto.setItem_img((String) map.get("save_url"));
        itemDto.setItem_price(new BigDecimal(itemForm.getItem_price()));
        itemDto.setIn_user((String)map.get("user_id"));
        itemDto.setUp_user((String)map.get("user_id"));
        itemDto.setUser_nic((String)map.get("user_nic"));

        return itemDto;
    }
    private String save_File(MultipartFile multipartFile) {
        //1. file 경로 설정.
        String uploadFolder="C:\\Users\\LDH\\Desktop\\Java_jungsuck";
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        String str=sdf.format(date);//2022-08-19
        String datePath=str.replace("-", File.separator);
        File uploadPath=new File(uploadFolder,datePath);
        if(uploadPath.exists()==false){
            uploadPath.mkdirs();
        }//여기까지 저장할 경로 생성
        String uploadFileName= multipartFile.getOriginalFilename();
        String uuid= UUID.randomUUID().toString();
        uploadFileName=uuid+'_'+uploadFileName;

        File saveFile=new File(uploadPath,uploadFileName);

        try {
            multipartFile.transferTo(saveFile);
        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (IllegalStateException e) {
            throw new RuntimeException(e);
        }
        //파일 저장
        String save_url=uploadFolder+'\\'+datePath+'\\'+uploadFileName;
        return save_url;
    }

    public String getUser_nic(String user_id) throws Exception {
        return itemDaoImpl.getUser_nic(user_id);
    }
    private void sprint(ItemForm itemForm) {
        System.out.println(itemForm.toString());
    }
}
