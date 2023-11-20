package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.FileBoard;
import kr.ed.haebeop.domain.FileDTO;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface FilesMapper {

    //fileDTO
    @Select("SELECT * FROM files WHERE par=#{par}")
    public FileDTO fileListByPar(String par) throws Exception;

    @Insert("INSERT INTO files VALUES (DEFAULT, #{par}, #{saveFolder}, #{originNm}, #{saveNm}, #{fileType}, DEFAULT)")
    public void filesInsert(FileDTO fileDTO) throws Exception;

    @Delete("DELETE FROM files WHERE par=#{par}")
    public void filesDeleteAll(String par) throws Exception;

    //fileboard
    @Select("SELECT * FROM fileboard ")
    public List<FileBoard> fileboardList() throws Exception;

    @Select("SELECT * FROM fileboard WHERE bno=#{bno}")
    public FileBoard fileboardGet(int bno) throws Exception;

    @Insert("insert into fileboard values(default, #{title}, #{content}, default, default)")
    public void fileboardInsert(FileBoard fileBoard) throws Exception;

    @Delete("DELETE FROM fileboard WHERE bno=#{bno}")
    public void fileboardDel(int bno) throws Exception;


}