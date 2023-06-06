package com.demo9.service.deposit;

import com.demo9.model.Customer;
import com.demo9.model.Deposit;
import com.demo9.model.Withdraw;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;


@Service
@Transactional
public class DepositServiceImpl implements IDepositService {

    //@Autowired
    //private DepositRepository depositRepository;


    @Override
    public List<Deposit> findALl() {
        return null;
    }

    @Override
    public Optional<Deposit> findById(Long id) {
        return Optional.empty();
    }

    @Override
    public Deposit save(Deposit deposit) {
        return null;
    }

    @Override
    public void deleteById(Long id) {

    }
    @Override
    public Customer delete(Deposit deposit) {

        return null;
    }
    @Override
    public Withdraw withdraw(Withdraw withdraw) {
        return null;
    }
}
