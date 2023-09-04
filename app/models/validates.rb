# frozen_string_literal: true

class BookValidator < ActiveModel::Validator
  def validate(record)
    validate_title(record)
    validate_author(record)
    validate_publication_year(record)
  end

  private

  def validate_title(record)
    if record.title.blank?
      record.errors.add(:title, "can't be blank")
    elsif Book.where.not(id: record.id).exists?(title: record.title)
      record.errors.add(:title, 'must be unique')
    end
  end

  def validate_author(record)
    record.errors.add(:author, "can't be blank") if record.author.blank?
  end

  def validate_publication_year(record)
    if record.publication_year.present? &&
       (record.publication_year < 1800 || record.publication_year > Date.today.year)
      record.errors.add(:publication_year, 'it is not within a valid range')
    end
  end
end
