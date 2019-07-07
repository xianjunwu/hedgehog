package pro.dengyi.hedgehog.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import pro.dengyi.hedgehog.model.entity.MyFile;

public interface FileDao extends JpaRepository<MyFile, Long> {

}
