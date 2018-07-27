package com.falled.controller;


import com.falled.domain.Message;
import com.falled.domain.User;
import com.falled.repos.MessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collector;
import java.util.stream.Collectors;

@Controller
public class MainController {

    @Autowired
    MessageRepository messageRepository;

    @Value("${upload.path}")
    private String uploadPath;

    @GetMapping("/")
    public String greeting(){
        return "/greeting";
    }


    @GetMapping("/main")
    public String view(@RequestParam(required = false, defaultValue = "") String filter, Model model){
        Iterable<Message> messages = messageRepository.findAll();
        if(filter != null && !filter.isEmpty()) {
            messages = messageRepository.findByTag(filter);
        }
        else {
            messages = messageRepository.findAll();
        }
        model.addAttribute("some", messages);
        model.addAttribute("filter", filter);
        return "index";
    }
    @PostMapping("/main")
    public String add(@RequestParam("file") MultipartFile file, @AuthenticationPrincipal User user, @Valid Message message, BindingResult bindingResult,  Model model) throws IOException {

        message.setAuthor(user);
        if (bindingResult.hasErrors()) {
            Map<String, String> errorMap = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errorMap);
            model.addAttribute("message", message);
        } else {
            if (file != null && !file.getOriginalFilename().isEmpty()) {
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }

                String uuidFile = UUID.randomUUID().toString();
                String resultFilename = uuidFile + "." + file.getOriginalFilename();

                file.transferTo(new File(uploadPath + "/" + resultFilename));
                message.setFilename(resultFilename);
            }
            messageRepository.save(message);
        }
            Iterable<Message> messages = messageRepository.findAll();
            model.addAttribute("some", messages);
            return "index";

    }




}
