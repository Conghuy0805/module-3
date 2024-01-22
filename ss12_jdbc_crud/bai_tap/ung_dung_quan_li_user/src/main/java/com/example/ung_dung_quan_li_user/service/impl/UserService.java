    package com.example.ung_dung_quan_li_user.service.impl;

    import com.example.ung_dung_quan_li_user.model.User;
    import com.example.ung_dung_quan_li_user.repository.IUserRepository;
    import com.example.ung_dung_quan_li_user.repository.impl.UserRepository;
    import com.example.ung_dung_quan_li_user.service.IUserService;

    import java.util.List;

    public class UserService implements IUserService {
        private IUserRepository iUserRepository = new UserRepository();

        @Override
        public void insertUser(User user) {
            iUserRepository.insertUser(user);
        }

        @Override
        public User selectUser(int id) {
            return iUserRepository.selectUser(id);
        }

        @Override
        public List<User> selectAllUsers() {
            return iUserRepository.selectAllUsers();
        }

        @Override
        public void delete(int id) {
            iUserRepository.delete(id);
        }

        @Override
        public void update(User user) {
            iUserRepository.update(user);
        }

        @Override
        public List<User> search(String value) {
            return iUserRepository.search(value);
        }

        @Override
        public void sortByName(List<User> list) {
            iUserRepository.sortByName(list);
        }

        @Override
        public void sortByEmail(List<User> list) {
            iUserRepository.sortByEmail(list);
        }

        @Override
        public void sortByCountry(List<User> list) {
            iUserRepository.sortByCountry(list);
        }
    }
