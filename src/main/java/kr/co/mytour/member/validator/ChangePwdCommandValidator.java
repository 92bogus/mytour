package kr.co.mytour.member.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import kr.co.mytour.member.vo.ChangePwdCommand;

public class ChangePwdCommandValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return ChangePwdCommand.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "currentPassword", "required");
		ValidationUtils.rejectIfEmpty(errors, "newPassword", "required");
		
	}
	
}
