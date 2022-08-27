package com.PSVM.dopamin.service.community;

import com.PSVM.dopamin.domain.community.BbsDto;
import com.PSVM.dopamin.domain.community.PostDto;
import com.PSVM.dopamin.domain.community.PostEmbedContentDto;
import java.util.List;
import java.util.Map;

public interface CommunityService {

    public List<PostEmbedContentDto> rankListPerHours() throws Exception;

    public Map<BbsDto, List<PostDto>> getAvailBbsPreview() throws Exception;

    public List<PostDto> getRecentPostList(Integer bbsId) throws Exception;
}
