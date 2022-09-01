package com.PSVM.dopamin.service.community;

import com.PSVM.dopamin.dao.community.BbsDao;
import com.PSVM.dopamin.dao.community.PostDao;
import com.PSVM.dopamin.domain.community.BbsDto;
import com.PSVM.dopamin.domain.community.PostDto;
import com.PSVM.dopamin.domain.community.PostEmbedContentDto;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommunityServiceImpl implements CommunityService {

    final Integer previewSize = 8;

    @Autowired
    private PostDao postDao;
    @Autowired
    private BbsDao bbsDao;

    @Override
    public List<PostEmbedContentDto> rankListPerHours() throws Exception {
        return null;
    }

    /**
     * community 메인 페이지의 모든 공개게시판의 미리보기 리스트를 제공함
     */
    @Override
    public Map<BbsDto, List<PostDto>> getAvailBbsPreview() throws Exception {
        LinkedHashMap<BbsDto, List<PostDto>> bbsPreviewMap = new LinkedHashMap<>();

        List<BbsDto> bbsList = bbsDao.findAllVisib();
        bbsList.sort(Comparator.comparingInt(BbsDto::getBbsPrior));

        for (BbsDto bbs : bbsList) {
            bbsPreviewMap.put(bbs, getRecentPostList(bbs.getBbsId()));
        }

        return bbsPreviewMap;
    }

    /**
     * * 게시판 1개의 previewSize 만큼의 미리보기 리스트 * @Param Integer 게시판 아이디 *
     */
    @Override
    public List<PostDto> getRecentPostList(Integer bbsId) throws Exception {
        return postDao.previewPost(bbsId, previewSize);
    }
}
