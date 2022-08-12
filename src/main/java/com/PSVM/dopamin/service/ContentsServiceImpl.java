package com.PSVM.dopamin.service;

import com.PSVM.dopamin.dao.ContentsDao;
import com.PSVM.dopamin.domain.ContentsDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ContentsServiceImpl implements ContentsService {

    @Autowired
    ContentsDao contentsDao;

    @Override
    public List<ContentsDto> contentsList() {
        return contentsDao.selectcnts();
    }
}

/*
*  assertTrue(contentsDao != null);
        System.out.println("contentsDap = " + contentsDao);
    }
}
* */
