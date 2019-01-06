package pro.dengyi.hedgehog.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import pro.dengyi.hedgehog.entity.File;

public interface FileDao extends JpaRepository<File, Long> {

}
